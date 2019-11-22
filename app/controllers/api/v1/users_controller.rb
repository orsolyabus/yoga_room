class Api::V1::UsersController < ApplicationController
  
  def show
    user = User.includes(:profile).find(params[:id])
    render json: user
  end
  
  def create
    user = user.new user_params
    if user.save
      render json: {status: :success}
    else
      render json:{ errors: user.errors.full_messages }
    end
  end

  def update
    if user.update user_params
      render json: {status: :success}
    else
      render json:{ errors: user.errors.full_messages }
    end
  end
  
  def destroy
    user.destroy
    render json: { status: :success }
  end
  
  private

  def user
    user.includes(:profile).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_teacher, :password, :password_confirmation)
  end
  
end
