class ProductsController < ApplicationController
  def index
    @products = Product.active.includes(:brand).order(:name)
  end

  def show
    @product  = Product.find(params[:id])
    @variants = @product.product_variants.active.order(:sphere)
    @line_item = LineItem.new # para o form “Adicionar ao carrinho”
  end
end