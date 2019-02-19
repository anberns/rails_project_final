class SessionsController < ApplicationController

  def new
  end

  def create
    swimmer = Swimmer.find_by(email: params[:email])
    if !swimmer
      flash[:notice] = "Account not found."
      return redirect_to '/'
    end
    return head(:forbidden) unless swimmer.authenticate(params[:password])
    session[:user_id] = swimmer.id 
    session[:user_type] = "swimmer"
    redirect_to swimmer_path(swimmer.id)
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