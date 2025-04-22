class Product < ApplicationRecord
    has_one_attached :image       # ActiveStorage
    extend FriendlyId             # se usar FriendlyId
    friendly_id :name, use: :slugged

    # Adiciona associações para brand, variants e categorias
    belongs_to :brand, optional: true
    has_many :product_variants
    has_many :categorizations
    has_many :categories, through: :categorizations
end
