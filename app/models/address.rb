# Address model: stores user addresses (shipping, billing, etc.)
class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, foreign_key: :shipping_address_id

  enum kind: { shipping: 0, billing: 1 }
end 