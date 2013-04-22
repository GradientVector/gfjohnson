class LessonsController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @lesson = current_user.lessons.build
  end
  
  def create
    #require 'debugger'; debugger
    @lesson = current_user.lessons.build(params[:lesson])
    if (@lesson.valid? && ensure_date_and_time_are_valid(@lesson))    
      @lesson.save
      flash[:success] = "Lesson scheduled!"
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end
  
  def destroy
  end
end