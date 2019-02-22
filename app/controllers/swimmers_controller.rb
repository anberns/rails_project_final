class SwimmersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def index
    if params[:team_id]
      @swimmers = Team.find(params[:team_id]).swimmers 
    else
      @swimmers = Swimmer.all 
    end
  end

  def new
    if session[:user_id] && !params[:team_id]
      redirect_to swimmer_path(session[:user_id])
    end
    @swimmer = Swimmer.new 
    @team_id = params[:team_id]
  end

  def create 
    @swimmer = Swimmer.new(swimmer_params)
    if @swimmer.valid?
      @swimmer.save
      # address render issue
      if params[:swimmer][:team_id] == "4"
        session[:user_id] = @swimmer.id
        session[:user_type] = "swimmer"
        redirect_to swimmer_path(@swimmer.id)
      else 
        redirect_to team_path(params[:swimmer][:team_id])
      end
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

end