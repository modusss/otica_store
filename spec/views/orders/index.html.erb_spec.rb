require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        user: nil,
        total: "9.99",
        status: 2,
        shipping_address: "Shipping Address",
        shipping_city: "Shipping City",
        shipping_zip: "Shipping Zip",
        shipping_country: "Shipping Country"
      ),
      Order.create!(
        user: nil,
        total: "9.99",
        status: 2,
        shipping_address: "Shipping Address",
        shipping_city: "Shipping City",
        shipping_zip: "Shipping Zip",
        shipping_country: "Shipping Country"
      )
    ])
  end

  it "renders a list of orders" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Shipping Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Shipping City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Shipping Zip".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Shipping Country".to_s), count: 2
  end
end
