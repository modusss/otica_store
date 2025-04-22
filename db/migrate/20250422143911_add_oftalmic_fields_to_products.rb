class AddOftalmicFieldsToProducts < ActiveRecord::Migration[8.0]
  def change
    change_table :products, bulk: true do |t|
      t.integer  :lens_type,      null: false, default: 0   # 0 = spherical
      t.integer  :wear_schedule,  null: false, default: 0   # 0 = daily
      t.string   :material
      t.decimal  :water_content,        precision: 5, scale: 2
      t.decimal  :oxygen_permeability,  precision: 6, scale: 2
      t.boolean  :uv_filter,      null: false, default: false
      t.integer  :pack_quantity
      t.boolean  :active,         null: false, default: true
      t.references :brand,        foreign_key: true
    end

    add_index :products, :lens_type
    add_index :products, :wear_schedule
    add_index :products, %i[active price]
  end
end
