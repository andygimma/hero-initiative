class Region < ActiveRecord::Base
    validates :name, presence: true
    has_many :users
    has_many :locations
end
