require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  let(:order) {
    Order.create!(
      user: nil,
      total: "9.99",
      status: 1,
      shipping_address: "MyString",
      shipping_city: "MyString",
      shipping_zip: "MyString",
      shipping_country: "MyString"
    )
  }

  before(:each) do
    assign(:order, order)
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(order), "post" do

      assert_select "input[name=?]", "order[user_id]"

      assert_select "input[name=?]", "order[total]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[shipping_address]"

      assert_select "input[name=?]", "order[shipping_city]"

      assert_select "input[name=?]", "order[shipping_zip]"

      assert_select "input[name=?]", "order[shipping_country]"
    end
  end
end
