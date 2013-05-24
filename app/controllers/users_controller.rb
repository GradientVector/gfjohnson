class UsersController < ApplicationController
  before_filter :not_signed_in_user, only: [:new, :create]
	before_filter :signed_in_user, only: [:show, :index, :edit, :update, :destroy]
  before_filter :correct_user_or_admin, only: [:show, :edit, :update]
  before_filter :admin_user, only: [:index, :destroy]
  before_filter :not_current_user, only: :destroy
  
  def index
    @users = User.paginate(page: params[:page]).where("is_active = true")
  end
  
	def show
	end
	
	def new
    @user = User.new
	end
	
  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      sign_in @user
      flash[:success] = "Welcome to G. F. Johnson Golf!"
      redirect_to @user
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      # Handle a successful update.
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render "edit"
    end
  end
  
  def destroy
    @user.toggle!(:is_active)
    flash[:success] = "User destroyed"
    redirect_to users_url
  end
  
  
  private
  
    def not_signed_in_user
      redirect_to(root_path) unless not signed_in?
    end

    def correct_user_or_admin
      @user = User.find(params[:id])
      redirect_to(root_path) unless (current_user?(@user) or current_user.admin?)
    end
    
    def not_current_user
      @user = User.find(params[:id])
      redirect_to root_path unless not current_user?(@user)
    end
end
