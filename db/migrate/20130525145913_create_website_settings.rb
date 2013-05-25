class CreateWebsiteSettings < ActiveRecord::Migration
  def change
    create_table :website_settings do |t|
      t.boolean :allow_lesson_request
      t.boolean :allow_user_signup

      t.timestamps
    end
  end
end
