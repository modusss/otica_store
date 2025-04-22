require 'rails_helper'

RSpec.describe "Checkout::Payments", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/checkout/payments/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/checkout/payments/create"
      expect(response).to have_http_status(:success)
    end
  end

end
