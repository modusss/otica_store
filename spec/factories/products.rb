FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    price { "9.99" }
    stock { 1 }
    sku { "MyString" }
    slug { "MyString" }
  end
end
