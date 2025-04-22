# app/controllers/checkout/addresses_controller.rb
class Checkout::AddressesController < ApplicationController
  before_action :authenticate_user!

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to new_checkout_payment_path(address_id: @address.id)
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address)
          .permit(:name, :street, :city, :state, :zip, :country)
  end
end