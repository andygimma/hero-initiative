class WorkshopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :authenticate_user_ownership!, only: [:edit, :update]
  
  def show
    @workshop = Workshop.find(params[:id])
  end

  def new
    @workshop = Workshop.new
    @locations = Location.all
  end

  def create
    @workshop = Workshop.new(workshops_params)
    if @workshop.save
      flash[:notice] = "You have created #{@workshop.name}. It will be reviewed and hopefully approved by an admin soon! Thank you!"
      redirect_to "/workshops/#{@workshop.id}/edit"
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
      redirect_to "/workshops/#{@workshop.id}/edit"
    else
      render 'edit'
    end
  end

  private
  def workshops_params
    params.require(:workshop).permit(
      :name, :description, :location_id, :user_id
    )
  end

  def authenticate_user_ownership!
    @workshop = Workshop.find(params[:id])
    redirect_to "/workshops" unless @workshop.user_id == current_user.id
  end
end
