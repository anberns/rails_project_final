class CoachesController < ApplicationController

  def new
    @coach = Coach.new 
  end

  def create 
    @coach = Coach.create(coach_params)
    redirect_to coach_path(@coach.id)
  end

  def show
    @coach = Coach.find(params[:id])
  end

  private

    def coach_params
      params.require(:coach).permit(
        :name,
        :password,
        :email,
        :team_id,
      )
    end
end
