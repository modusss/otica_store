class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_items, dependent: :destroy
  enum status: { pending: 0, paid: 1, shipped: 2, canceled: 3 }
end
