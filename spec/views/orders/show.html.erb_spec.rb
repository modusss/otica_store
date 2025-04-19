require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    assign(:order, Order.create!(
      user: nil,
      total: "9.99",
      status: 2,
      shipping_address: "Shipping Address",
      shipping_city: "Shipping City",
      shipping_zip: "Shipping Zip",
      shipping_country: "Shipping Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Shipping Address/)
    expect(rendered).to match(/Shipping City/)
    expect(rendered).to match(/Shipping Zip/)
    expect(rendered).to match(/Shipping Country/)
  end
end
