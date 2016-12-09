class SchoolsController < ApplicationController
  before_action :require_login
  before_action :check_school_match

  def show
    @school = School.find(params[:id])
  end

  private
  def check_school_match
    unless current_teacher.school_id == params[:id].to_i
      redirect_to school_path(current_teacher.school)
    end
  end
end
