class AdminPanel::DashboardController < Admin::BaseController
  layout 'admin'

  def index
    @stats = {
      products:  Product.count,
      variants:  ProductVariant.count,
      orders:    Order.count,
      revenue:   Order.sum(:total)
    }
  end
end