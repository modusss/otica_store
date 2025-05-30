require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      user: nil,
      total: "9.99",
      status: 1,
      shipping_address: "MyString",
      shipping_city: "MyString",
      shipping_zip: "MyString",
      shipping_country: "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

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
