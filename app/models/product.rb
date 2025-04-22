class Product < ApplicationRecord
    has_one_attached :image       # ActiveStorage
    extend FriendlyId             # se usar FriendlyId
    friendly_id :name, use: :slugged

    # Enum no formato Rails 8
    enum :lens_type,
    { spherical: 0, toric: 1, multifocal: 2, cosmetic: 3 }

    enum :wear_schedule,
    { daily: 0, weekly: 1, monthly: 2 }

    # Adiciona associações para brand, variants e categorias
    belongs_to :brand, optional: true
    has_many :product_variants, dependent: :destroy
    has_many :categorizations, dependent: :destroy
    has_many :categories, through: :categorizations

    # Validações existentes
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    
    # Scope para produtos ativos (para reutilização)
    scope :available, -> { active.where.not(name: nil).includes(:brand, :image_attachment) }
end
