class Lesson < ActiveRecord::Base
  attr_accessible :occurs_at_date, :occurs_at_time
  belongs_to :user
  
  validates :user_id, presence: true
  validates :occurs_at_date, presence: true
  validates :occurs_at_time, presence: true
  
  default_scope order: 'lessons.occurs_at_date DESC, lessons.occurs_at_time DESC'
  
  def occurs_at
    d = occurs_at_date
    t = occurs_at_time
    DateTime.new(d.year, d.month, d.day, t.hour, t.min. t.sec)
  end
  
  def occurs_at=(datetime)
    dt = datetime
    occurs_at_date = Date.new(dt.year, dt.month. dt.day)
    occurs_at_time = Time.new(dt.hour, dt.min, dt.sec)
  end
end
