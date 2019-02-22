class SwimmerEventsController < ApplicationController
   
  def update
    puts "here"
    @se = SwimmerEvent.find(params[:id])
    if @se
      @se.update(personal_record: params[:swimmer_event][:personal_record])
      redirect_to swimmer_path(@se.swimmer_id)
    end
    # find_by_id vs find -> errors
  end
  
end
