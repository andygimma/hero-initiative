class Admin::DashboardController < ActionController::Base
  layout "layouts/admin"

  before_action :authenticate_admin!

  def index
  end

  private

  def authenticate_admin!
    redirect_to "/" unless current_user and current_user.role == "admin"
  end
end
