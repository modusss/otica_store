module Checkout
  class OrdersController < ApplicationController
    def success
      reset_session_cart
      flash[:notice] = "Pagamento aprovado! Obrigado pela compra."
    end

    def cancel
      flash[:alert] = "Pagamento não concluído."
    end

    private

    def reset_session_cart
      current_cart.destroy
      session[:cart_id] = nil
    end
  end
end