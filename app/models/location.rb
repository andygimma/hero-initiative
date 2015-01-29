class Location < ActiveRecord::Base

  geocoded_by :geocodable_address   # can also be an IP address
  after_validation :geocode

  belongs_to :region
  has_many :workshops

  validates :name, presence: true
  validates :full_street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :region_id, presence: true

  def geocodable_address
    "#{full_street_address} #{city} #{state} #{zip_code}"
  end
end
