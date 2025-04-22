require 'rails_helper'

RSpec.describe "Webhooks::Pagseguros", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/webhooks/pagseguro/create"
      expect(response).to have_http_status(:success)
    end
  end

end
