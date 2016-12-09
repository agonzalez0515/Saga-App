class SchoolsController < ApplicationController
  before_action :require_login

  def show
    @school = School.find(params[:id])
  end

end
