# Brand model: represents product brands
class Brand < ApplicationRecord
  has_many :products
end 