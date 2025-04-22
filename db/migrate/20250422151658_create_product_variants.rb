class CreateProductVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true

      t.decimal :sphere,   precision: 4, scale: 2, null: false
      t.decimal :cylinder, precision: 4, scale: 2          # nulo p/ esférica
      t.integer :axis                                      # nulo p/ esférica
      t.decimal :add_power, precision: 3, scale: 2         # multifocal
      t.decimal :base_curve, precision: 3, scale: 2, null: false
      t.decimal :diameter,  precision: 4, scale: 2, null: false
      t.string  :color
      t.integer :stock,       null: false, default: 0
      t.decimal :unit_price,  precision: 10, scale: 2
      t.string  :sku
      t.boolean :active,      null: false, default: true
      t.jsonb   :attribute_set

      t.timestamps
    end

    add_index :product_variants, %i[product_id sphere cylinder axis add_power base_curve diameter], name: "idx_variants_lookup"
    add_index :product_variants, :sku, unique: true
  end
end