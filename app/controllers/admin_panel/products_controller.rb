class AdminPanel::ProductsController < AdminPanel::BaseController
  before_action :set_product, only: %i[edit update destroy]

  def index
    @products = Product.order(:name).includes(:brand)
  end

  def new
    @product = Product.new
    @product.product_variants.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Produto criado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Atualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: "Removido."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :price, :brand_id,
      :lens_type, :wear_schedule, :pack_quantity,
      product_variants_attributes: %i[id sphere cylinder axis
                                      base_curve diameter stock
                                      unit_price sku _destroy]
    )
  end
end