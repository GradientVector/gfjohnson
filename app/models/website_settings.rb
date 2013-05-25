class WebsiteSettings < ActiveRecord::Base
  attr_accessible :allow_lesson_request, :allow_user_signup

  after_initialize do
    if new_record?
      self.allow_lesson_request = true 
      self.allow_user_signup = true 
    end
  end

  validates :allow_lesson_request, inclusion: { in: [true, false] }
  validates :allow_user_signup, inclusion: { in: [true, false] }

  default_scope order: 'website_settings.id ASC'
end
