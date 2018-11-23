class YogaClassesController < ApplicationController
  before_action :find_yoga_class, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @yoga_class = YogaClass.new
    @location = Location.new
  end

  def create
    @yoga_class = YogaClass.new yoga_class_params
    @yoga_class.user = current_user
    @yoga_class.location = Location.find params[:yoga_class][:location_id]
    if @yoga_class.save
      redirect_to @yoga_class
    else
      render :new
    end
  end

  def show
  end

  def index
    @yoga_classes = YogaClass.all
  end

  def update
    if @yoga_class.update yoga_class_params
      redirect_to @yoga_class
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @yoga_class.destroy
    render :index
  end

  private

  def find_yoga_class
    @yoga_class = YogaClass.find params[:id]
  end

  def yoga_class_params
    params.require(:yoga_class).permit(:title, :description, :location )
  end

  def authorize_user!
    flash[:warning] = "you have to be a teacher to do that" unless can? :crud, YogaClass
  end

end
