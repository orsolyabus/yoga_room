class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :authorize_user!, only: [:new, :create, :update, :destroy]
  before_action :get_country, only: [:index]

  def index
    @locations = Location.where("country ILIKE ?", session[:country])
  end

  def new
    @location = Location.new
  end

  def create
    params = location_params
    params[:country] = current_user.default_country
    @location = Location.new params
    respond_to do |format|
      if @location.save
        @yoga_class = YogaClass.new
        format.js
      else
        format.js {render :error}
      end
    end
  end

  # def edit
  # end

  def show
  end

  private

  def find_location
    @location = Location.find params[:id]
  end

  def location_params
    params.require(:location).permit(:city, :region, :address, :studio, :country )
  end

  def authorize_user!
    flash[:warning] = "you have to be a teacher to do that" unless can? :crud, Location
  end

end
