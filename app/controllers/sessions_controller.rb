class SessionsController < ApplicationController

  def new
  end

  def create

    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      user.last_login = Time.now
      user.save
      flash[:success] = "Signed in!"
      redirect_to yoga_classes_path
    else
      flash.now[:danger] = 'Wrong credentials!'

      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:success] = "Signed out!"
    redirect_to root_path
  end

end
