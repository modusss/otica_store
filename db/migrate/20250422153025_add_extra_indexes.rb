class AddExtraIndexes < ActiveRecord::Migration[8.0]
  def change
    add_index :line_items,  :created_at
    add_index :product_variants, :active, where: "active", name: "idx_variants_active"
  end
end