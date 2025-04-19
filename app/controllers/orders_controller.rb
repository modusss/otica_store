class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:user_id, :total, :status, :shipping_address, :shipping_city, :shipping_zip, :shipping_country)
    end

end
