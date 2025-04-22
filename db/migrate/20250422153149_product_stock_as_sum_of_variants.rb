class ProductStockAsSumOfVariants < ActiveRecord::Migration[8.0]
  def up
    execute <<~SQL
      CREATE OR REPLACE FUNCTION sync_product_stock()
      RETURNS TRIGGER AS $$
      BEGIN
        UPDATE products
          SET stock = (
            SELECT COALESCE(SUM(stock), 0)
            FROM product_variants
            WHERE product_id = NEW.product_id
          )
        WHERE id = NEW.product_id;
        RETURN NEW;
      END;
      $$ LANGUAGE plpgsql;

      CREATE TRIGGER trg_sync_stock_after_variants
      AFTER INSERT OR UPDATE OR DELETE ON product_variants
      FOR EACH ROW EXECUTE FUNCTION sync_product_stock();
    SQL
  end

  def down
    execute <<~SQL
      DROP TRIGGER IF EXISTS trg_sync_stock_after_variants ON product_variants;
      DROP FUNCTION IF EXISTS sync_product_stock();
    SQL
  end
end