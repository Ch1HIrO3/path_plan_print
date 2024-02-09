class ScheduleSummary
  include ActiveModel::Model
  attr_accessor :name, :password, :title, :content, :schedule_id

  with_options presence: true do
    validates :name, :password, :schedule_id
  end

  def save
    schedule = Schedule.create(name: name, password: password)
    Summary.create(title: title, content: content, schedule_id: schedule.id)
  end
end