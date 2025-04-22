class ApplicationController < ActionController::Base
  helper_method :current_cart, :current_user, :user_signed_in?

  private

  def current_cart
    @current_cart ||= if user_signed_in?
      current_user.cart || current_user.create_cart
    else
      begin
        Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
      end
    end
  end
end