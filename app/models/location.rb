class Location < ApplicationRecord
    belongs_to :driver
    validates :driver_id, uniqueness: true, presence: true
    validates :longitude, presence: true
    validates :latitude, presence: true
end
