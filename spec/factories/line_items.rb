FactoryBot.define do
  factory :line_item do
    cart { nil }
    product { nil }
    quantity { 1 }
    unit_price { "9.99" }
  end
end
