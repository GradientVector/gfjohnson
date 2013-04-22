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
  attr_accessor :date_string
  attr_accessible :date_string
  belongs_to :user
  
  after_initialize do
    if self.date_string.nil?
      date = DateTime.tomorrow
      self.date_string = "#{date.month}/#{date.day}/#{date.year}"
    end
  end
  
  after_validation :combine_date_and_time
  
  validates :user_id, presence: true
  VALID_DATE_STRING_REGEX = /\A\d\d?\/\d\d?\/\d\d\d\d\z/i
  validates :date_string, presence: true,
    format: { with: VALID_DATE_STRING_REGEX }
  # VALID_TIME_STRING_REGEX = /\A(\d\d?):(\d\d)(am|pm) - (\d\d?):(\d\d)(am|pm)\z/i
  # validates :time_string, presence: true,
    # format: { with: VALID_TIME_STRING_REGEX }
  
  default_scope order: 'lessons.date_time DESC'
      
  def formatted_date_time
    if self.date_time.nil?
      "Unknown date and time"
    else
      self.date_time.strftime("%B %d, %Y")
      #self.date_time.strftime("%B %d, %Y at %I:%M %p")
    end
  end  
    
  private      
    def combine_date_and_time
      if not date_string.nil?
        begin
          d = DateTime.strptime(date_string, "%m/%d/%Y")
          # t = time
          self.date_time = DateTime.new(d.year, d.month, d.day)     
        rescue ArgumentError
          self.date_time = nil
        end
      end
    end
        
end
