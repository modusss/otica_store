class ApplicationController < ActionController::Base
  helper_method :current_cart

  private

  def current_cart
    @current_cart ||= begin
      if user_signed_in?
        current_user.cart || current_user.create_cart
      else
        Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
      end
    end
  end
end