class Admin::RegionsController < ActionController::Base
  layout "layouts/admin"

  before_action :authenticate_admin!

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:notice] = "You have created #{@region.name}."
      redirect_to "/admin/regions"
    else
      render 'new'
    end
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(region_params)
      flash[:notice] = "You have updated #{@region.name}."
      redirect_to "/admin/regions"
    else
      render 'edit'
    end
  end

  def destroy
    Region.destroy(params[:id])
    flash[:notice] = "Region deleted"
    redirect_to "/admin/regions"
  end
  private

  def authenticate_admin!
    redirect_to "/" unless current_user and current_user.role == "admin"
  end

  def region_params
    params.require(:region).permit(
      :name
    )
  end
end
