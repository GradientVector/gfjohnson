class LessonTypesController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user

  def new
    @lesson_type = LessonType.new
  end

  def create
    @lesson_type = LessonType.new(params[:lesson_type])
    if (@lesson_type.save)
      flash[:success] = "Lesson type added!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    @lesson_type.active = false
    redirect_to root_url
  end

end
