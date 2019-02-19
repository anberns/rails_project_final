class EventsController < ApplicationController
  before_action :require_login

  def new 
    @event = Event.new

  def index
    @events= Event.all 
  end

  def show
    @event = Event.find(params[id])
  end

  def create
    event = Event.new(event_params)
    if event.valid?
      event.save
    end
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
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
