class WorkshopDatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :authenticate_user_ownership!, only: [:edit, :update]

  def new
    @workshop_date = WorkshopDate.new
    @workshops = Workshop.where(user_id: current_user.id)
  end

  def create
    @workshop_date = WorkshopDate.new(workshop_date_params)
    if @workshop_date.save
      flash[:notice] = "You have created #{@workshop_date.name}. It will be reviewed and hopefully approved by an admin soon! Thank you!"
      redirect_to "/workshop_dates/#{@workshop_date.id}/edit"
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
      redirect_to "/workshop_dates/#{@workshop_date.id}/edit"
    else
      render 'edit'
    end
  end

  private

  def workshop_date_params
    params.require(:workshop_date).permit(
      :name, :start_time, :end_time, :workshop_id, :description, :user_id
    )
  end

  def authenticate_user_ownership!
    @workshop_date = WorkshopDate.find(params[:id])
    redirect_to "/profile/#{current_user.id}" unless @workshop_date.user_id == current_user.id
  end
end
