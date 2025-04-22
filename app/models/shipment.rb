# Shipment model: shipping info for orders
class Shipment < ApplicationRecord
  belongs_to :order

  enum :status, { pending: 0, shipped: 1, delivered: 2 }
end 