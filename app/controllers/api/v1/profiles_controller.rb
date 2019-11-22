class Api::V1::ProfilesController < ApplicationController
  def teachers
    @teachers = Profile.all.includes(:locations, :yoga_classes)
    render json: @teachers, each_serializer: SimpleProfileSerializer,include: [:yoga_classes, :locations]
  end
  
  def show
    profile = Profile.includes(:locations, :yoga_classes).find(params[:id])
    render json: profile, serializer: FullProfileSerializer, include: [:yoga_classes, :locations]
  end
  
  def create
    profile = Profile.new profile_params
    if profile.save
      render json: {status: :success}
    else
      render json:{ errors: profile.errors.full_messages }
    end
  end

  def update
    if profile.update profile_params
      render json: {status: :success}
    else
      render json:{ errors: profile.errors.full_messages }
    end
  end
  
  def destroy
    profile.destroy
    render json: { status: :success }
  end
  
  private

  def profile
    Profile.includes(:locations, :yoga_classes).find(params[:id]) # don't we need the schedule too?
  end

  def profile_params
    params.require(:profile).permit(:name, :image_url, :web, :phone, :intro, :public_contact, :image, :contact, :is_teacher)
  end
end
