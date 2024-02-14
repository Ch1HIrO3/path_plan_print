class SchedulesController < ApplicationController
  before_action :set_schedule, only:[:edit, :update]

  def index
    @schedule = Schedule.all
  end
  
  def new
    @schedule = Schedule.new
    @schedule.summaries.build 
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.valid?
      @schedule.save
      redirect_to schedules_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    schedule_attributes = @schedule.attributes
    @schedule = Schedule.new(schedule_attributes)
  end
  
  def search
    @schedule = Schedule.search(params[:name], params[:password]).first
    if @schedule.nil?
      render :index
    else
      redirect_to edit_schedule_path(@schedule.id)
    end
  end

  def update
    schedule=Schedule.find(params[:id])
    schedule.update(schedule_params)
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(
      :name,
      :password,
      summaries_attributes: [:id, :title, :content, :_destroy]
      )
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end