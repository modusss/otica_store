class HomeController < ApplicationController
  # Busca todos os produtos para exibir na landing page
  def index
    @products = Product.all
  end
end
