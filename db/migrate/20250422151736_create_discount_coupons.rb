class CreateDiscountCoupons < ActiveRecord::Migration[8.0]
  def change
    create_table :discount_coupons do |t|
      t.string  :code, null: false
      t.integer :kind, null: false           # 0 = fixed, 1 = percent, 2 = free_shipping
      t.decimal :value, precision: 10, scale: 2
      t.integer :max_uses
      t.datetime :expires_at
      t.timestamps
    end
    add_index :discount_coupons, :code, unique: true
  end
end