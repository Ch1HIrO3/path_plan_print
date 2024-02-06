class SchedulesController < ApplicationController
  def index
  end

  def new
    @schedule_summary = ScheduleSummary.new
  end
  
  def create
    @schedule_summary = ScheduleSummary.new(schedule_params)
    if @schedule_summary.valid?
      @schedule_summary.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

def schedule_params
  params.require(:schedule_summary).permit(:name, :password, :title,:content)
end

end