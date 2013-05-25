class WebsiteSettingsController < ApplicationController
  before_filter :signed_in_user
  before_filter :admin_user

  def index
    @website_settings = WebsiteSettings.first
    @website_settings ||= WebsiteSettings.new # create new website settings if they don't exist yet

    redirect_to edit_website_setting_path(@website_settings)
  end

  def edit
    @website_settings = WebsiteSettings.find(params[:id])
  end

  def update
    @website_settings = WebsiteSettings.find(params[:id])

    if (@website_settings.update_attributes(params[:website_settings]))
      flash[:success] = "Website settings updated"
    end
    render "edit"
  end
end
