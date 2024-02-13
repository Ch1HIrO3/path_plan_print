class SchedulesController < ApplicationController
  before_action :set_schedule, only:[:edit, :update]

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
    schedule_attributes = @schedule.attributes
    @schedule_summary = ScheduleSummary.new(schedule_attributes)
    binding.pry
    @schedule_summary.title = @schedule.title
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
    # paramsの内容を反映したインスタンスを生成する
    @schedule_summary = ScheduleSummary.new(schedule_params)
    # @schedule_summary.name ||= @schedule.name.blob
    # @schedule_summary.password ||= @schedule.password.blob
    # @schedule_summary.title ||= @schedule.title.blob
    # @schedule_summary.content ||= @schedule.content.blob

    if @schedule_summary.valid?
      @schedule_summary.update(schedule_params, @schedule)
      render :edit, status: :unprocessable_entity
    else
      render :edit, status: :unprocessable_entity
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