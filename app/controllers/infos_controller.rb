class InfosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]
  before_action :find_info, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [ :edit, :update, :delete]
  

  def new
    @info = Info.new
    @user = current_user
  end

  def create
    @info = Info.new(info_params)
    @info.user = current_user
    if @info.save
      flash[:success] = "profile successfully created."
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit  
    @user = @info.user || current_user  
  end

  def update
    if @info.update info_params
      flash[:success] = "profile successfully updated."
      redirect_to user_path(current_user)
    else
      flash[:danger] = @info.errors.full_messages.join(" ")
      render :edit
    end
  end

  def destroy
    @info.destroy
    redirect_to @info.user
  end  

  private

  def find_info
    @info = Info.find(params[:id])
  end

  def info_params
    params.require(:info).permit(:spiritual_name, :image_url, :webpage, :phone, :introduction, :public_contact, :image) 
  end

  def authorize_user!
    unless can? :crud, @info
      flash[:danger] = "Access Denied"
      redirect_to root_path
    end
  end

end
