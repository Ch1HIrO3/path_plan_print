class ScheduleSummary
  include ActiveModel::Model
  attr_accessor( 
    :name, :password, :title, :content, 
    :id, :created_at, :updated_at)

  with_options presence: true do
    validates :name, :password
  end

  def save
    schedule = Schedule.create(name: name, password: password)
    @schedule_id = schedule.id
    Summary.create(title: title, content: content, schedule_id: @schedule_id)
  end

  def update(params, schedule)
    schedule.summary.destroy_all
    title = params.delete(:title)
    summary = Summary.where(title: title).first_or_initialize if title.present?
    summary.save if title.present?

    schedule.update(params)
    
  end
end