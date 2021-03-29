class Passenger < ApplicationRecord
    validates_presence_of :longitude
    validates_presence_of :latitude
end
