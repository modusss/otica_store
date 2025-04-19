class LineItemsController < InheritedResources::Base

  private

    def line_item_params
      params.require(:line_item).permit(:cart_id, :product_id, :quantity, :unit_price)
    end

end
