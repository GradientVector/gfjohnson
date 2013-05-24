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

    it { should_not have_link("delete") }

    describe "delete links" do
      let!(:one_lesson_package) { FactoryGirl.create(:private_lesson_package_type) }
      before do
        visit private_lesson_package_types_path
      end
      
      it { should have_link("delete", href: private_lesson_package_type_path(one_lesson_package)) }
      it "should only soft-delete a private lesson package type" do
        expect { click_link "delete" }.not_to change(PrivateLessonPackageType, :count)
      end

      describe "after clicking link" do
        before do
          click_link "delete"
        end
        it { should_not have_link("delete", href: private_lesson_package_type_path(one_lesson_package)) }
      end
    end
  end
end
