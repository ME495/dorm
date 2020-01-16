class TeamsController < ApplicationController

  skip_before_action :require_student_login
  skip_before_action :verify_authenticity_token

  def index
    @teams = Team.paginate(page:params[:page], per_page:15)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to teams_path
    else
      render "edit"
    end
  end

  def new

  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path
    else
      render "new"
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  def team_params
    params.require(:team).permit(:name, :department)
  end
end
