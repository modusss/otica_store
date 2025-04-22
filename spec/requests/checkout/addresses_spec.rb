require 'rails_helper'

RSpec.describe "Checkout::Addresses", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/checkout/addresses/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/checkout/addresses/create"
      expect(response).to have_http_status(:success)
    end
  end

end
