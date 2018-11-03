class ApplicationController < ActionController::Base
  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id])
  end
  helper_method :current_teacher
end
