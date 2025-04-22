class AddCascadeToItems < ActiveRecord::Migration[8.0]
  def change
    # remove FK antiga e recria com ON DELETE CASCADE
    remove_foreign_key :order_items, :orders
    add_foreign_key    :order_items, :orders, on_delete: :cascade

    remove_foreign_key :line_items, :carts
    add_foreign_key    :line_items, :carts, on_delete: :cascade
  end
end