class CoachesController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @coach = Coach.new 
  end

  def create 
    @coach = Coach.new(coach_params)
    if @coach.valid?
      @coach.save
      redirect_to coach_path(@coach.id)
    else
      render :new
    end
  end

  def show
    @coach = Coach.find(params[:id])
    if !authenticate_user(@coach.id)
      return head(:forbidden) 
    end
  end

  def edit
    @coach = Coach.find(params[:id])
    if !authenticate_user(@coach.id)
      return head(:forbidden) 
    end
  end

  def update
    @coach = Coach.find(params[:id])
    if !authenticate_user(@coach.id)
      return head(:forbidden) 
    end
    @coach.update(coach_params)
    redirect_to coach_path(@coach.id)
  end

  private

    def coach_params
      params.require(:coach).permit(
        :name,
        :password,
        :email,
        :team_id
      )
    end

    def authenticate_user(id)
      id == session[:user_id]
    end

    def require_login 
      return head(:forbidden) unless session.include? :user_id 
    end
end
