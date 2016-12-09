class SessionsController < ApplicationController
  def new
    #automatically render login form
  end

  def create
    @teacher = Teacher.find_by_email(params[:email])

    if @teacher && @teacher.authenticate(params[:password])
      login(@teacher)
      redirect_to school_teachers_path(@teacher.school, @teacher)
    else
      flash[:alert] = "Username or Password Incorrect!"
      redirect_to login_path
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to root_path
  end
end
