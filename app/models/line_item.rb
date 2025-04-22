class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product_variant
  before_validation :set_unit_price
  
  def set_unit_price
    self.unit_price ||= product_variant.unit_price
  end

  def product
    product_variant.product
  end
end
