require 'spec_helper'

describe "PrivateLessonPackageTypePages" do

  subject { page }

  describe "index" do
    let("admin") { FactoryGirl.create(:admin) }

    before do
      sign_in admin
      visit private_lesson_package_types_path
    end

    it { should have_selector("title", text: "All private lesson package types") }
    it { should have_selector("h1", text: "All private lesson package types") }
  end
end
