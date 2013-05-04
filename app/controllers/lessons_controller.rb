class LessonsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy
  
  def new
    @lesson = current_user.lessons.build
  end
  
  def create
    #require 'debugger'; debugger
    @lesson = current_user.lessons.build(params[:lesson])
    if (@lesson.valid? && ensure_date_and_time_are_valid(@lesson))    
      @lesson.save
      flash[:success] = "Lesson scheduled!"
      redirect_to root_url
    else
      render "new"
    end
  end
  
  def destroy
    @lesson.destroy
    redirect_to root_url
  end
  
  private
  
    def correct_user
      @lesson = current_user.lessons.find_by_id(params[:id])
      redirect_to root_url if @lesson.nil?
    end
end