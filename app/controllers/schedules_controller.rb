class SchedulesController < ApplicationController
  # before_action :set_schedule, only:[:edit]

  def index
    @schedule = Schedule.all
  end
  
  def new
    @schedule_summary = ScheduleSummary.new
  end

  def create
    @schedule_summary = ScheduleSummary.new(schedule_params)
    if @schedule_summary.valid?
      @schedule_summary.save
      redirect_to schedules_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def search
    @schedule = Schedule.search(params[:name], params[:password])
    if @schedule.nil?
      render :index
    else
      redirect_to edit_schedule_path(@schedule)
    end
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path, notice: 'Schedule was successfully updated.'
    else
      render :edit
    end
  end
  
  private
  
  def schedule_params
    params.require(:schedule_summary).permit(
    :name, :password, :title, :content)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end