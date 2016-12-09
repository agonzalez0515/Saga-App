class TeamsController < ApplicationController

  def new
    @school = School.find(params[:school_id])
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    @team.school_id = params[:school_id]
    @team.teacher = current_teacher

    if @team.save
      redirect_to school_team_path(@team.school, @team)
    else
      render 'new'
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to school_team_path(@team.school,@team)
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to school_path
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end
end
