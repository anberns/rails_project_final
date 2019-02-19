class WelcomeController < ApplicationController

  def home
    if session[:user_id]
      redirect_to swimmer_path(session[:user_id])
    end
  end

end