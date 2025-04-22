class AddProductVariantToLineAndOrderItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :line_items,  :product_variant, null: false, foreign_key: true
    add_reference :order_items, :product_variant, null: false, foreign_key: true
    remove_reference :line_items,  :product
    remove_reference :order_items, :product
  end
end
