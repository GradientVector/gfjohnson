class StaticPagesController < ApplicationController
	def home
    #@lesson = current_user.lessons.build if signed_in?    
    if signed_in?
      if current_user.admin?
        @lessons = Lesson.paginate(page: params[:page])
      else
        @lessons = current_user.lessons.paginate(page: params[:page]) if signed_in?
      end
    end
	end
	
	def products_and_services
	end
	
	def technology
	end
	
	def about
	end
	
	def contact
	end
end
