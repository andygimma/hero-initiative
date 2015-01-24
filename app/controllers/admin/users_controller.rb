class Admin::UsersController < ActionController::Base
  layout "layouts/admin"

  before_action :authenticate_admin!

  def index
    @users = User.all.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    @regions = Region.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated #{@user.email}."
      redirect_to "/admin/users"
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
    @regions = Region.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have created #{@user.email}."
      redirect_to "/admin/users"
    else
      @regions = Region.all
      render 'new'
    end
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = "User deleted"
    redirect_to "/admin/users"
  end

  private

  def authenticate_admin!
    redirect_to "/" unless current_user and current_user.role == "admin"
  end

  def user_params
    params.require(:user).permit(
      :role, :email, :password, :password_confirmation, :region_id
    )
  end
end
