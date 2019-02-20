class TeamsController < ApplicationController
  before_action :require_login

  def index
    @teams = Team.all 
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
    if session[:user_type] != 'coach' || !authorized?(@team)
      return head(:forbidden)
    end
  end

  def update
    @team = Team.find(params[:id])
    if session[:user_type] != 'coach' || !authorized?(@team)
      return head(:forbidden)
    end
    @team.update(team_params)
    redirect_to team_path(@team.id)
  end 

  private

  def team_params
    params.require(:team).permit(
      :name,
      :hq
    )
  end

end
