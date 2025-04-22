class CreateAddressesPaymentsShipments < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :kind, null: false, default: 0   # 0 = shipping
      t.string  :name
      t.string  :street
      t.string  :city
      t.string  :state
      t.string  :zip
      t.string  :country, default: "Brasil"
      t.timestamps
    end

    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.string  :provider
      t.string  :provider_id
      t.decimal :amount, precision: 10, scale: 2
      t.integer :status, default: 0          # 0 = awaiting
      t.jsonb   :payload
      t.datetime :paid_at
      t.timestamps
    end
    add_index :payments, %i[provider provider_id], unique: true

    create_table :shipments do |t|
      t.references :order, null: false, foreign_key: true
      t.string  :carrier
      t.string  :tracking_code
      t.decimal :cost, precision: 10, scale: 2
      t.integer :status, default: 0          # 0 = pending
      t.datetime :shipped_at
      t.datetime :delivered_at
      t.timestamps
    end
  end
end