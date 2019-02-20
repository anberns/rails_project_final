class SwimmersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    if session[:user_id]
      redirect_to swimmer_path(session[:user_id])
    end
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
    if @swimmer.valid?
      redirect_to swimmer_path(@swimmer.id)
    else
      puts "invalid"
      render :edit
    end
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