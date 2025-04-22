class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { customer: 0, admin: 1 }
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :shipments, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :product_variants, dependent: :destroy
end
