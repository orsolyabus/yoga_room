class Api::V1::UsersController < ApplicationController
  
  def teachers
    @teachers = User.joins(:info).where(is_teacher: true)
    render json: @teachers
  end
  
end
