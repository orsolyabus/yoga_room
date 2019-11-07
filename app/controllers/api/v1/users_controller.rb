class Api::V1::UsersController < ApplicationController
  
  def teachers
    teachers = User.where(is_teacher: true)
    render json: teachers
  end
  
end
