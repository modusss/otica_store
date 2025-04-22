# DiscountCoupon model: stores discount codes
class DiscountCoupon < ApplicationRecord
  enum :kind, { percentage: 0, fixed: 1 }
  end
end 