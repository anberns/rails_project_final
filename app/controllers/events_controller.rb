class EventsController < ApplicationController
  before_action :require_login

  def new 
    @event = Event.new
  end

  def index
    @events= Event.all 
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.valid?
      redirect_to events_path
    else
      render :edit
    end
  end 

  def destroy
    
    Event.find(params[:id]).destroy 
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :distance,
      :stroke
    )
  end

  def require_login 
    return head(:forbidden) unless session.include? :user_id 
  end
end
