class Workshop < ActiveRecord::Base
  belongs_to :location

  validates :name, presence: true
  validates :description, presence: true
  validates :location_id, presence: true
end
