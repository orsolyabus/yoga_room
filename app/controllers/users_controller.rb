class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @info = @user.info || Info.new(user: current_user)
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
    redirect_to users_path
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
