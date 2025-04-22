class AddStockToProductsAndTrigger < ActiveRecord::Migration[8.0]
  def up
    # Adiciona a coluna se não existir
    add_column :products, :stock, :integer, default: 0, null: false \
      unless column_exists?(:products, :stock)

    # Cria a função trigger
    execute <<~SQL
      CREATE OR REPLACE FUNCTION sync_product_stock()
      RETURNS TRIGGER AS $$
      BEGIN
        IF TG_OP = 'DELETE' THEN
          UPDATE products
          SET stock = (
            SELECT COALESCE(SUM(stock), 0)
            FROM product_variants
            WHERE product_id = OLD.product_id
          )
          WHERE id = OLD.product_id;
          RETURN OLD;
        ELSE
          UPDATE products
          SET stock = (
            SELECT COALESCE(SUM(stock), 0)
            FROM product_variants
            WHERE product_id = NEW.product_id
          )
          WHERE id = NEW.product_id;
          RETURN NEW;
        END IF;
      END;
      $$ LANGUAGE plpgsql;
    SQL

    # Cria o trigger
    execute <<~SQL
      DROP TRIGGER IF EXISTS trg_sync_stock_after_variants ON product_variants;
      
      CREATE TRIGGER trg_sync_stock_after_variants
      AFTER INSERT OR UPDATE OR DELETE ON product_variants
      FOR EACH ROW
      EXECUTE FUNCTION sync_product_stock();
    SQL
  end

  def down
    execute <<~SQL
      DROP TRIGGER IF EXISTS trg_sync_stock_after_variants ON product_variants;
      DROP FUNCTION IF EXISTS sync_product_stock();
    SQL
    
    remove_column :products, :stock if column_exists?(:products, :stock)
  end
end