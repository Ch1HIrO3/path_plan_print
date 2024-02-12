class ScheduleSummary
  include ActiveModel::Model
  attr_accessor :name, :password, :title, :content

  with_options presence: true do
    validates :name, :password
  end

  def save
    schedule = Schedule.create(name: name, password: password)
    @schedule_id = schedule.id
    Summary.create(title: title, content: content, schedule_id: @schedule_id)
  end
end