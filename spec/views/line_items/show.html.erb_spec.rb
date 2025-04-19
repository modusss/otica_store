require 'rails_helper'

RSpec.describe "line_items/show", type: :view do
  before(:each) do
    assign(:line_item, LineItem.create!(
      cart: nil,
      product: nil,
      quantity: 2,
      unit_price: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
  end
end
