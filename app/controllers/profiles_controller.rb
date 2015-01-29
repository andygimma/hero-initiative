class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @workshop_dates = WorkshopDate.where(status: "approved").order(start_date: :desc).limit(5)
    @workshops = Workshop.where(status: "approved", user_id: current_user.id)
  end
end
