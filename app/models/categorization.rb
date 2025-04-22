# Categorization model: join table between products and categories
class Categorization < ApplicationRecord
  belongs_to :product
  belongs_to :category
end 