class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  before_validation :set_unit_price
  
  def set_unit_price
    self.unit_price ||= product.price
  end
end
