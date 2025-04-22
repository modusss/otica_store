class AddCheckConstraints < ActiveRecord::Migration[8.0]
  def change
    execute <<~SQL
      ALTER TABLE line_items
        ADD CONSTRAINT chk_line_items_quantity_pos
        CHECK (quantity > 0);

      ALTER TABLE order_items
        ADD CONSTRAINT chk_order_items_quantity_pos
        CHECK (quantity > 0);

      ALTER TABLE product_variants
        ADD CONSTRAINT chk_variants_sphere_range
        CHECK (sphere BETWEEN -20 AND 20);
    SQL
  end
end