class SwimmersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @swimmer = Swimmer.new 
  end

  def create 
    @swimmer = Swimmer.new(swimmer_params)
    if @swimmer.valid?
      @swimmer.save
      session[:user_id] = @swimmer.id
      session[:user_type] = "swimmer"
      redirect_to swimmer_path(@swimmer.id)
    else
      render :new
    end
  end

  def show
    @swimmer = Swimmer.find(params[:id])
    if !authenticate_user(@swimmer.id)
      return head(:forbidden) 
    end
  end

  def edit
    @swimmer = Swimmer.find(params[:id])
    if !authenticate_user(@swimmer.id)
      return head(:forbidden) 
    end
  end

  def update
    @swimmer = Swimmer.find(params[:id])
    if !authenticate_user(@swimmer.id)
      return head(:forbidden) 
    end
    @swimmer.update(swimmer_params)
    redirect_to swimmer_path(@swimmer.id)
  end

  private

    def swimmer_params
      params.require(:swimmer).permit(
        :name,
        :password,
        :email,
        :team_id,
        event_ids:[],
        events_attributes: [:name, :distance, :stroke]
      )
    end

    def authenticate_user(id)
      id == session[:user_id]
    end

    def require_login 
      return head(:forbidden) unless session.include? :user_id 
    end
end