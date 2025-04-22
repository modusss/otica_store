class PaymentStatus < ApplicationRecord
  has_many :payments, dependent: :destroy
  enum payment_status: { awaiting: 0, confirmed: 1, failed: 2 }
end
