class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user_type

  def index
    @users = user_type_class.all
  end

  def show
  end

  def new
    @user = user_type_class.new
  end

  def edit
  end

  def create
    @user = user_type_class.new(user_params)
    if @user.save
      redirect_to @user, notice: "#{user_type} was successfully created."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "#{user_type} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user_type
    @user_type = user_type
  end

  def user_type
    User.user_types.include?(params[:type]) ? params[:type] : "User"
  end

  def user_type_class
    user_type.constantize
  end

  def find_user
    @user = user_type_class.find(params[:id])
  end

  def user_params
    params.require(user_type.underscore.to_sym).permit(:name, :user_type) 
  end
end
