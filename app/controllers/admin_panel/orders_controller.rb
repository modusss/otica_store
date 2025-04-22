class AdminPanel::OrdersController < AdminPanel::BaseController
  def index
    @orders = Order.order(created_at: :desc).includes(:user)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to panel_order_path(@order), notice: 'Pedido atualizado com sucesso.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end 