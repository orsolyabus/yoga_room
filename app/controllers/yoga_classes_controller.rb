class YogaClassesController < ApplicationController
  before_action :find_yoga_class, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @yoga_class = YogaClass.new
  end

  def create
    @yoga_class = YogaClass.new yoga_class_params
    if @yoga_class.save
      redirect_to @yoga_class
    else
      flash[:danger] = @yoga_class.errors.full_messages.join(" ")
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
      flash[:danger] = @yoga_class.errors.full_messages.join(" ")
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
    params.require(:yoga_class).permit(:title, :description )
  end

end
