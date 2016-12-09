class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_teacher

  private
  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

  def login(teacher)
    session[:teacher_id] = teacher.id
  end

  def is_admin?
    current_teacher.admin
  end
end
