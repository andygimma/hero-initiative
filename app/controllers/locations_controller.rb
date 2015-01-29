class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @workshops = Workshop.where(location_id: @location.id, status: "approved")
  end
end
