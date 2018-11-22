class Api::V1::YogaClassesController < ApplicationController

  def create
    yoga_class = YogaClass.new yoga_class_params
    # yoga_class.user = current_user
    # @tag = Tag.find_or_initialize_by(name: params[:tag])
    # location = Location.find_or_initialize_by(address: params[:address])
    if yoga_class.save
      render json: yoga_class
    else
      render json:{ errors: yoga_class.errors.full_messages }
    end

  end

  def index 
    yoga_classes = YogaClass.all
    render json: yoga_classes
  end

  def show
    render json: yoga_class
  end

  def update
    if yoga_class.update yoga_class_params
      render json: {status: :success}
    else
      render json:{ errors: yoga_class.errors.full_messages }
    end
  end

  def destroy
    yoga_class.destroy
    render json: { status: :success }
  end

  private

  def yoga_class
    YogaClass.find params[:id]
  end

  def yoga_class_params
    params.require(:yoga_class).permit(:title, :description )
  end

end
