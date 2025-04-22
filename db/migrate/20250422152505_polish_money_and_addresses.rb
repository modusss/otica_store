class PolishMoneyAndAddresses < ActiveRecord::Migration[8.0]
  def change
    # 1. padroniza colunas monetárias
    change_column :orders,      :total,       :decimal, precision: 10, scale: 2
    change_column :line_items,  :unit_price,  :decimal, precision: 10, scale: 2
    change_column :order_items, :unit_price,  :decimal, precision: 10, scale: 2
    change_column :products,    :price,       :decimal, precision: 10, scale: 2

    # 2. substitui shipping* por FK (exemplo)
    add_reference :orders, :shipping_address, foreign_key: { to_table: :addresses }
    remove_column :orders, :shipping_address, :string
    remove_column :orders, :shipping_city,    :string
    remove_column :orders, :shipping_zip,     :string
    remove_column :orders, :shipping_country, :string, default: "Brasil"
  end
end