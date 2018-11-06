class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      flash[:success] = "Signed in!"
      redirect_to user
    else
      flash.now[:danger] = 'Wrong credentials!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:success] = "Signed out!"
    redirect_to teachers_path
  end

end
