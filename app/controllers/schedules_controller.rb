class SchedulesController < ApplicationController
  before_action :set_schedule, only:[:edit]
  # before_action :password, only:[:index]

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
    # @schedule_summary = ScheduleSummary.find(schedule_params[:schedule_id])
  end

  def search
    @schedule = Schedule.search([params[:name], params[:password]])
  end

  def update
    schedule_summary = ScheduleSummary.find(params[:id])
    schedule_summary.update(schedule_params)
  end
  
  private
  
  def schedule_params
    params.require(:schedule_summary).permit(
      :name, :password, :title, :content, :schedule_id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

    # def password
    #   @pass = [
      #     [*0..9].sample(4),
      #     [*'a'..'z'].sample(4),
      #     [*'A'..'Z'].sample(4),
      #     ['#', '?', '!', '@', '$', '%', '^', '&', '*', '-'].sample(4),
      #   ].sum([]).shuffle.join
      # end
    end
    