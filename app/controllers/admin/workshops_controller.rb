class Admin::WorkshopsController < ActionController::Base
  layout "layouts/admin"

  before_action :authenticate_admin!

  def index
    @workshops = Workshop.all
  end

  def new
    @workshop = Workshop.new
    @locations = Location.all
  end

  def create
    @workshop = Workshop.new(workshops_params)
    if @workshop.save
      flash[:notice] = "You have created #{@workshop.name}."
      redirect_to "/admin/workshops"
    else
      @locations = Location.all
      render 'new'
    end
  end

  def edit
    @workshop = Workshop.find(params[:id])
    @locations = Location.all
  end

  def update
    @workshop = Workshop.find(params[:id])
    if @workshop.update(workshops_params)
      flash[:notice] = "You have updated #{@workshop.name}."
      redirect_to "/admin/workshops"
    else
      render 'edit'
    end
  end

  def destroy
    Workshop.destroy(params[:id])
    flash[:notice] = "Workshop deleted"
    redirect_to "/admin/workshops"
  end
  private

  def authenticate_admin!
    redirect_to "/" unless current_user and current_user.role == "admin"
  end

  def workshops_params
    params.require(:workshop).permit(
      :name, :description, :location_id
    )
  end
end
