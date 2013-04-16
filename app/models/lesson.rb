# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  date_time  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lesson < ActiveRecord::Base
  attr_accessible :date
  belongs_to :user
  
  after_initialize { self.date_time ||= DateTime.tomorrow }
  
  # before_save :combine_date_and_time
  
  validates :user_id, presence: true
  validates :date_time, presence: true
  # validates :time, presence: true
  
  default_scope order: 'lessons.date_time DESC'
  
  # Attributes
  def date
    formatted_date
  end
  
  def date=(date)
    begin
      if date.nil?
        self.date_time = nil
      else
        self.date_time = DateTime.strptime(date, "%m/%d/%Y")
      end
    rescue ArgumentError
      self.date_time = nil
    end
  end
  
  def formatted_date_time
    if self.date_time.nil?
      "Unknown date and time"
    else
      self.date_time.strftime("%B %d, %Y at %I:%M %p")
    end
  end
  
  def formatted_date
    if self.date_time.nil?
      "Unknown date"
    else  
      self.date_time.strftime("%m/%d/%Y")
    end
  end
    
  # private  
    # def combine_date_and_time
      # d = date
      # # t = time
      # @date_time = DateTime.new(d.year, d.month, d.day)
    # end
end
