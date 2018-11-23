class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :authorize_user!, only: [:new, :create, :update, :destroy]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new location_params
    if @location.save
      redirect_to @location
    else
      render :new 
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
    params.require(:location).permit(:country, :city, :state, :address, :studio )
  end

  def authorize_user!
    flash[:warning] = "you have to be a teacher to do that" unless can? :crud, Location
  end

end
