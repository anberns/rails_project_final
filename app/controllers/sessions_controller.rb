class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user_type] == "coach"
      coach = Coach.find_by(email: params[:email])
      return head(:forbidden) unless coach.authenticate(params[:password])
      session[:user_id] = coach.id 
      session[:user_type] = "coach"
      redirect_to coach_path(coach.id)
    else
      swimmer = Swimmer.find_by(email: params[:email])
      return head(:forbidden) unless swimmer.authenticate(params[:password])
      session[:user_id] = swimmer.id 
      session[:user_type] = "swimmer"
      redirect_to swimmers_path(swimmer.id)
    end
  end

  def destroy
    session.delete :user_id 
    session.delete :user_type
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
end