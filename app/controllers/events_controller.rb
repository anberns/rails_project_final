class EventsController < ApplicationController
  before_action :require_login

  def new 
    @event = Event.new
  end

  def filter
    if params[:filter_type] == "All Events"
      @events = Event.sort
    elsif params[:filter_type] == "By Distance"
      @events = Event.filter_by_distance(params[:filter_value])
      puts @events
    elsif params[:filter_type] == "By Stroke"
      @events = Event.filter_by_stroke(params[:filter_value])
    end
    render :index
  end

  def index
    @events = Event.sort 
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

end
