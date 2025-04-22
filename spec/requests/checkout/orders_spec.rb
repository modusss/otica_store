require 'rails_helper'

RSpec.describe "Checkout::Orders", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/checkout/orders/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /success" do
    it "returns http success" do
      get "/checkout/orders/success"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /cancel" do
    it "returns http success" do
      get "/checkout/orders/cancel"
      expect(response).to have_http_status(:success)
    end
  end

end
