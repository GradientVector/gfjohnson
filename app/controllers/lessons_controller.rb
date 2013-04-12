class LessonsController < ApplicationController
  before_filter :signed_in_user
  
  def new
    @lesson = current_user.lessons.build
  end
  
  def create
    @lesson = current_user.lessons.build(params[:lesson])
    if @lesson.save
      flash[:success] = "Lesson scheduled!"
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end
  
  def destroy
  end
end