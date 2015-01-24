class Location < ActiveRecord::Base

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode

  belongs_to :region

  validates :name, presence: true
  validates :full_street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :region_id, presence: true
end
