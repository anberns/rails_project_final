class TeamsController < ApplicationController
  before_action :require_login

  def index
    @teams = Team.all 
  end

  def show
    @team = Team.find(params[:id])
    if !authorized?(@team)
      return head(:forbidden)
    end
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

  def require_login 
    return head(:forbidden) unless session.include? :user_id 
  end

  def authorized?(team)
    ids = []
    if session[:user_type] == "coach"
      team.coaches.each do |coach|
        ids << coach.id 
      end
      if !ids.include?(session[:user_id])
        return false
      else
        return true
      end
    else
      team.swimmers.each do |swimmer|
        ids << swimmer.id
      end
      if !ids.include?(session[:user_id])
        return false
      else
        return true
      end
    end
  end
    
end
