class SchoolsController < ApplicationController
  before_action :require_login
  before_action :check_school_match

  def show
    @school = School.find(params[:id])
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      redirect_to school_path(@school)
    else
      flash[:alert] = @school.errors.full_messages
      render "edit"
    end
  end

  private
  def check_school_match
    unless current_teacher.school_id == params[:id].to_i
      redirect_to school_path(current_teacher.school)
    end
  end

  def school_params
    params.require(:school).permit(:admin_code, :teacher_code)
  end
end
