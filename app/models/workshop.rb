class Workshop < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :workshop_dates

  validates :name, presence: true
  validates :description, presence: true
  validates :location_id, presence: true
end
