class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin!
    redirect_to root unless current_user.role == "admin"
  end

  def after_sign_in_path_for(resource)
    if current_user.role == "admin"
      admin_root_path()
    elsif current_user.role == "user"
      "/profile/#{current_user.id}"
    end
  end
end
