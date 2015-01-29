class StaticPagesController < ApplicationController
  def index
  end

  def about
  end

  def calendar
    @workshops = WorkshopDate.where(status: "approved")
    @workshops_by_date = @workshops.group_by(&:start_date)
  end

  def map
    @locations = Location.all
  end

  def workshops
    @workshops = Workshop.where(status: "approved")
  end

  def locations
    @locations = Location.all
  end
end
