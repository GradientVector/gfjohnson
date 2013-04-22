module LessonsHelper

  def time_ago_in_words(lesson)
    if lesson.date_time.nil?
      ""
    else  
      time_difference = distance_of_time_in_words_to_now(lesson.date_time)
      if lesson.date_time.past?
        "Occured #{time_difference} ago."
      else
        "Occurs #{time_difference} from now."
      end
    end
  end
  
  def ensure_date_and_time_are_valid(lesson)
    if lesson.date_time.blank?
      lesson.errors[:date_string] = "cannot be blank"
    else
      lesson_date = lesson.date_time.to_date
      today_date = DateTime.now.to_date
      
      if lesson_date < today_date
        lesson.errors[:date_string] = "cannot be in the past"
      elsif lesson_date == today_date
        lesson.errors[:date_string] = "cannot be today. Please call directly if you really want a lesson today."
      elsif lesson_date > 1.year.from_now.to_date
        lesson.errors[:date_string] = "cannot be more than one year from now"
      end
    end
    
    return lesson.errors.empty?
  end
end