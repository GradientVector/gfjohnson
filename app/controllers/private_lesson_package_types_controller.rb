class PrivateLessonPackageTypesController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user

  def index
    @private_lesson_package_types = PrivateLessonPackageType.where("is_active = true").paginate(page: params[:page])
  end

  def show
  end

  def new
    @private_lesson_package_type = PrivateLessonPackageType.new
  end

  def create
    @private_lesson_package_type = PrivateLessonPackageType.new(params[:private_lesson_package_type])
    if (@private_lesson_package_type.save)
      flash[:success] = "Private lesson package type added!"
      redirect_to private_lesson_package_types_url
    else
      render "new"
    end
  end

  def destroy
    @private_lesson_package_type = PrivateLessonPackageType.find(params[:id])
    @private_lesson_package_type.toggle!(:is_active)
    flash[:success] = "Private lesson package type deactivated"
    redirect_to private_lesson_package_types_url
  end
end
