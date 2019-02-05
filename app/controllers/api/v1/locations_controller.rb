class Api::V1::LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    location = Location.new location_params
    if location.save
      render json: {status: :success}
    else
      render json:{ errors: location.errors.full_messages }
    end
  end

  def update
    if location.update location_params
      render json: {status: :success}
    else
      render json:{ errors: location.errors.full_messages }
    end
  end

  def show
    render json: location
  end

  def index
    locations = Location.all.order(:city)
    render json: locations
  end

  private

  def location
    Location.find params[:id]
  end

  def location_params
    params.require(:location).permit(:country, :city, :address, :studio)
  end
end
