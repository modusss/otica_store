# app/controllers/checkout/payments_controller.rb
class Checkout::PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = build_order
  end

  def create
    @order = build_order
    @order.save!
    # integração com gateway aqui…
    redirect_to success_checkout_order_path
  end

  private

  def build_order
    Order.new(
      user: current_user,
      shipping_address_id: params[:address_id],
      status: :pending,
      total:  current_cart.line_items.sum { _1.quantity * _1.unit_price },
      order_items: current_cart.line_items.map do |li|
        li.attributes.slice("product_variant_id", "quantity", "unit_price")
      end
    )
  end
end