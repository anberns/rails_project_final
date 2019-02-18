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

  private

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
