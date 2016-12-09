class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_teacher # this is required for header

  private
  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

  def login(teacher)
    session[:teacher_id] = teacher.id
  end

  # def logged_in?
  #   !!session[:teacher_id]
  # end

  def is_admin?
    current_teacher.admin
  end

  def require_login
    redirect_to login_path unless session[:teacher_id]
  end

  def check_school_match
    unless current_teacher.school.id == params[:school_id].to_i
      redirect_to school_path(current_teacher.school)
    end
  end
end
