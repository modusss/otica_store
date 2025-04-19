require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        description: "MyText",
        price: "9.99",
        stock: 2,
        sku: "Sku",
        slug: "Slug"
      ),
      Product.create!(
        name: "Name",
        description: "MyText",
        price: "9.99",
        stock: 2,
        sku: "Sku",
        slug: "Slug"
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sku".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Slug".to_s), count: 2
  end
end
