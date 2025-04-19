class Product < ApplicationRecord
    has_one_attached :image       # ActiveStorage
    extend FriendlyId             # se usar FriendlyId
    friendly_id :name, use: :slugged
end
