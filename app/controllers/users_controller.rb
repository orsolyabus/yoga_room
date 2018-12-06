class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @users = User.includes(:info).includes(:yoga_classes).where(is_teacher: true)
  end

  def show
    @yoga_classes = YogaClass.includes(:location, :schedule).where(user_id: params[:id]).order(created_at: :desc)
    @info = @user.info || Info.new(user: @user)
    @saved_searches = SavedSearch.where user_id: params[:id]
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "account successfully created."
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "account successfully updated."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def thank_you
    user = User.find params[:id]
    user.update last_login: Time.now
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_teacher, :password, :password_confirmation) 
  end

  def authorize_user!
    unless can? :crud, @user
      flash[:danger] = "Access Denied"
      redirect_to root_path
    end
  end
end
