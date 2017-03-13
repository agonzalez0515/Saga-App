class SessionsController < ApplicationController
  def new
    #automatically render login form
  end

  def create
    session_input = session_params
    @teacher = Teacher.find_by_email(session_input[:email])

    if @teacher && @teacher.authenticate(session_input[:password])
      login(@teacher)
      redirect_to school_teacher_path(@teacher.school_id, @teacher)
    else
      flash[:alert] = "Username or Password Incorrect!"
      redirect_to login_path
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
