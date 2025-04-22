# app/controllers/admin_panel/base_controller.rb
class AdminPanel::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!
  
    layout "admin"   # teremos um layout separado
  
    private
  
    def authorize_admin!
      redirect_to root_path, alert: "Sem acesso" unless current_user.admin?
    end
  end