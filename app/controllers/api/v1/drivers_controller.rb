class Api::V1::DriversController < ApplicationController
  def index
  end

  def create 
    driver = Driver.new(name: params[:name],
                        email: params[:email],
                        phone_number: params[:phone_number], 
                        license_number: params[:license_number],
                        car_number: params[:car_number])
    if driver.save
      render json: driver, status: 201
    else
      render json: {'status': "failure", 'reason': "unable to register driver"}, status: 400
    end 
  end

  def saveLocation
    location = Location.new
    location.driver_id = params[:id]
    location.longitude = params[:longitude]
    location.latitude = params[:latitude]

      if location.save
        render json: {"status": "success"}, status: 202
      else
        render json: {"status": "failure", "reason": "unable to save location"}, status: 400
      end
  end

  def show
  end
end
