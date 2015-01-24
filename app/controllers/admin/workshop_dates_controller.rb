class Admin::WorkshopDatesController < ActionController::Base
  layout "layouts/admin"

  before_action :authenticate_admin!

  def index
    @workshop_dates = WorkshopDate.all
  end

  def new
    @workshop_date = WorkshopDate.new
    @workshops = Workshop.all
  end

  def create
    @workshop_date = WorkshopDate.new(workshop_date_params)
    if @workshop_date.save
      flash[:notice] = "You have created #{@workshop_date.name}."
      redirect_to "/admin/workshop_dates"
    else
      @workshops = Workshop.all
      render 'new'
    end
  end

  def edit
    @workshop_date = WorkshopDate.find(params[:id])
    @workshops = Workshop.all
  end

  def update
    @workshop_date = WorkshopDate.find(params[:id])
    if @workshop_date.update(workshop_date_params)
      flash[:notice] = "You have updated #{@workshop_date.name}."
      redirect_to "/admin/workshop_dates"
    else
      render 'edit'
    end
  end

  def destroy
    WorkshopDate.destroy(params[:id])
    flash[:notice] = "Workshop Date deleted"
    redirect_to "/admin/workshop_dates"
  end
  private

  def authenticate_admin!
    redirect_to "/" unless current_user and current_user.role == "admin"
  end

  def workshop_date_params
    params.require(:workshop_date).permit(
      :name, :start_time, :end_time, :workshop_id, :description
    )
  end
end
