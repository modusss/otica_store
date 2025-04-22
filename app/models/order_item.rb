class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product_variant
  before_validation :set_unit_price
  
  def set_unit_price
    self.unit_price ||= product_variant.product.price
  end
end
