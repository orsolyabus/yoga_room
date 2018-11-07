class InfosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]
  before_action :authorize_user!, only: [ :edit, :update, :delete]

  def new
    @info = Info.new
    @user = current_user
  end

  def show

  end

  def create
    render "creating profile"
  end

  def edit
    
  end

  def update

  end

  def destroy

  end  

end
