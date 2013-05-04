class StaticPagesController < ApplicationController
	def home
    #@lesson = current_user.lessons.build if signed_in?    
    @lessons = current_user.lessons.paginate(page: params[:page]) if signed_in?
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