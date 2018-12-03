class YogaClassesController < ApplicationController
  before_action :find_yoga_class, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @yoga_class = YogaClass.new
    @location = Location.new
    @yoga_class.build_schedule
  end

  def create
    @yoga_class = YogaClass.new yoga_class_params
    @yoga_class.user = current_user

    @location = Location.find_or_initialize_by(id: params[:yoga_class][:location_id])
    @yoga_class.location = @location

    @schedule = Schedule.new(yoga_class_params[:schedule_attributes])
    @yoga_class.schedule = @schedule

    if  (@yoga_class.save && @schedule.save)
      SearchAlertJob.perform_later(@yoga_class)
      redirect_to @yoga_class
    else
      render :new
    end
  end

  def show
  end

  def index
    @yoga_classes = YogaClass.all
    @saved_search = SavedSearch.new
  end

  def update
    if @yoga_class.update yoga_class_params
      redirect_to @yoga_class
    else
      render :new
    end
  end

  def edit
    @location = @yoga_class.location
  end

  def destroy
    @yoga_class.destroy
    render :index
  end

  def search
    @params = params
    @yoga_classes = helpers.search_this(YogaClass.all, params)
    @saved_search ||= SavedSearch.new
    respond_to do |format|
      format.js { render }
      format.html { render :index }
    end
  end

  private

  def find_yoga_class
    @yoga_class = YogaClass.find params[:id]
  end

  def yoga_class_params
    params.require(:yoga_class).permit(:title, :description, :location, schedule_attributes: [:start, :end, :duration, :class_type, :id] )
  end

  def authorize_user!
    unless can?(:crud, YogaClass.new )
      flash[:warning] = "you have to be a teacher to do that" 
      redirect_to yoga_classes_path
    end
  end

end
