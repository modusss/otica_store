# ProductVariant model: specific product configurations (e.g., prescription)
class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :line_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :sphere, :base_curve, :diameter, presence: true
end 