class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  before_validation :set_unit_price
  
  def set_unit_price
    self.unit_price ||= product.price
  end
end
