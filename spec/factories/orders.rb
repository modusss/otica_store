FactoryBot.define do
  factory :order do
    user { nil }
    total { "9.99" }
    status { 1 }
    shipping_address { "MyString" }
    shipping_city { "MyString" }
    shipping_zip { "MyString" }
    shipping_country { "MyString" }
  end
end
