class WorkshopDate < ActiveRecord::Base
  belongs_to :workshop

  before_validation :add_start_date
  validates :name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :workshop_id, presence: true

  def add_start_date
    self.start_date = self.start_time.to_date
  end
end
