class SessionsController < ApplicationController
  def new
    #automatically render login form
  end

  def create
    @teacher = Teacher.find_by_email(params[:email])

    if @teacher && @teacher.authenticate(params[:password])
      session[:teacher_id] = @teacher.id
      redirect_to school_teachers_url(@teacher.school, @teacher)
    else
      flash[:alert] = "Username or Password Incorrect!"
      redirect_to login_url
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to root_url
  end
end
