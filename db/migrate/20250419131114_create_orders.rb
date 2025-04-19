class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total
      t.integer :status
      t.string :shipping_address
      t.string :shipping_city
      t.string :shipping_zip
      t.string :shipping_country, default: 'Brasil'
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
