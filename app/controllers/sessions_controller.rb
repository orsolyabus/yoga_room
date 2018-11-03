class SessionsController < ApplicationController

  def new
  end

  def create
    @teacher = Teacher.find_by_email(params[:email])
    if @teacher && @teacher.authenticate(params[:password])
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher), notice: 'Signed in!'
    else
      flash.now[:alert] = 'Wrong credentials!'
      render :new
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end 

end
