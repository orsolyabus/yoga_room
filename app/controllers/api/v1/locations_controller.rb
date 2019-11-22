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
    render json: location, serializer: FullLocationSerializer, include: [:yoga_classes, :profile]
  end

  def index
    locations = Location.all.order(:city).includes(:profile, :yoga_classes)
    render json: locations, each_serializer: SimpleLocationSerializer, include: [:yoga_classes, :profile]
  end

  def destroy
    location.destroy
    render json: { status: :success }
  end
  
  private

  def location
    Location.includes(:profile, :yoga_classes).find(params[:id])
  end

  def location_params
    params.require(:location).permit(:country, :city, :address, :studio)
  end
end
