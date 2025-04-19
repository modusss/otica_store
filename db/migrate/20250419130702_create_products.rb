class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :stock
      t.string :sku
      t.string :slug

      t.timestamps
    end
    add_index :products, :sku
    add_index :products, :slug
  end
end
