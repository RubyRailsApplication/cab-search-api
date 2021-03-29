class Api::V1::TravellersController < ApplicationController
  def create
    passengerLocation = Passenger.new
    passengerLocation.latitude = params[:latitude]
    passengerLocation.longitude = params[:longitude]

    if !passengerLocation.longitude.present? || !passengerLocation.latitude.present?
      render json: {"message": "Error"}, status: 400
    else
      Location.all.each do |driver_location|
          loc1 = [passengerLocation.latitude,passengerLocation.longitude]
          loc2 = [driver_location.latitude,driver_location.longitude]
          distance = get_distance(loc1, loc2)
          #render json: {"mess": distance}, status: 200
          if distance <= 7000000
               @driver = Driver.find_by(id: driver_location.driver_id)
               render json: {
                "available_cabs": [
                   @driver.map! do |cabs|
                      {"name": cabs.name,
                      "phone_number": cabs.phone_number,
                      "car_number": cabs.car_number}
                    end   
                ]
              }, status: 200
          else
              render json: {"message": "No cabs available!"}, status: 200      
          end
      end
    end
  end

  def get_distance(loc1,loc2)
    # Computation using Haversine formula
    rad_per_deg = Math::PI/180  # PI / 180
    rad_in_km = 6371                  # Earth radius in kilometers
    rad_in_m = rad_in_km * 1000             # Radius in meters

    dlat_rad = (loc2[0] - loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1] - loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rad_in_m * c # Delta in meters
  end
end
