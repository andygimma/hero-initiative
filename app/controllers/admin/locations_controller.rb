class Admin::LocationsController < ActionController::Base
  layout "layouts/admin"

  before_action :authenticate_admin!

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
    @regions = Region.all
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = "You have created #{@location.name}."
      redirect_to "/admin/locations"
    else
      @regions = Region.all
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
    @regions = Region.all
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      flash[:notice] = "You have updated #{@location.name}."
      redirect_to "/admin/locations"
    else
      render 'edit'
    end
  end

  def destroy
    Location.destroy(params[:id])
    flash[:notice] = "Location deleted"
    redirect_to "/admin/locations"
  end

  private

  def authenticate_admin!
    redirect_to "/" unless current_user and current_user.role == "admin"
  end

  def location_params
    params.require(:location).permit(
      :name, :full_street_address, :city, :state, :zip_code, :region_id
    )
  end
end
