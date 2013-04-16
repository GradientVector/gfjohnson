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
end