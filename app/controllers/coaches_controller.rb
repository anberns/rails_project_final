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
      session[:user_id] = @coach.id
      session[:user_type] = "coach"
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
    if @coach.valid?
      redirect_to coach_path(@coach.id)
    else
      render :edit
    end
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
