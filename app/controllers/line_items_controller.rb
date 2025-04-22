class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[update destroy]

  def create
    @line_item = current_cart.line_items
                             .find_or_initialize_by(product_variant_id: line_item_params[:product_variant_id])
    @line_item.quantity += line_item_params[:quantity].to_i
    @line_item.unit_price ||= @line_item.product_variant.unit_price || @line_item.product_variant.product.price
    @line_item.save!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to cart_path, notice: "Item adicionado." }
    end
  end

  def update
    @line_item.update(line_item_params)
    respond_to(&:turbo_stream)
  end

  def destroy
    @line_item.destroy
    respond_to(&:turbo_stream)
  end

  private

  def set_line_item
    @line_item = current_cart.line_items.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_variant_id, :quantity)
  end
end