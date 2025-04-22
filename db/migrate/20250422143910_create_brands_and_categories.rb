class CreateBrandsAndCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :brands, :name, unique: true

    create_table :categories do |t|
      t.string  :name, null: false
      t.string  :slug, null: false
      t.references :parent, foreign_key: { to_table: :categories }, index: true
      t.timestamps
    end
    add_index :categories, :slug, unique: true

    create_table :categorizations, id: false do |t|
      t.references :product,  null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
    add_index :categorizations, %i[product_id category_id], unique: true
  end
end