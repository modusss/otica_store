class AddUniqueCompositeIndexToProductVariants < ActiveRecord::Migration[8.0]
  def change
    add_index :product_variants,
              %i[product_id sphere cylinder axis add_power base_curve diameter],
              unique: true,
              name: "idx_variants_unique"
  end
end