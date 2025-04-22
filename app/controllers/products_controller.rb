class ProductsController < ApplicationController
  def index
    @products = Product
      .active
      .includes(:brand, :image_attachment)  # Eager load brand e imagem
      .where.not(name: nil)                 # Previne produtos sem nome
      .order(:name)
  rescue => e
    # Log do erro para monitoramento
    Rails.logger.error("Erro ao carregar produtos: #{e.message}")
    # Fallback para uma lista vazia em caso de erro
    @products = Product.none
  end

  def show
    @product  = Product.find(params[:id])
    @variants = @product.product_variants.active.order(:sphere)
    @line_item = LineItem.new # para o form “Adicionar ao carrinho”
  end
end