class SwimmerEventsController < ApplicationController
   
  def update
    puts params
    @se = SwimmerEvent.find(params[:id])
    if @se
      @se.update(personal_record: params[:personal_record])
      redirect_to swimmer_path(@se.swimmer_id)
    end

  end
end
