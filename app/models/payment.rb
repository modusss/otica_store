# Payment model: payment info for orders
class Payment < ApplicationRecord
  belongs_to :order

  enum status: { pending: 0, paid: 1, failed: 2 }
end 