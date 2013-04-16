require 'spec_helper'

describe "Lesson pages" do

  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "lesson creation" do
    before { visit new_lesson_path }
    
    describe "with invalid information" do
      before { fill_in "lesson_date", with: " " }
      
      it "should not create a lesson" do
        expect { click_button "Schedule" }.not_to change(Lesson, :count)
      end
      
      describe "error messages" do
        before { click_button "Schedule" }
        it { should have_content("error") }
      end
    end
    
    describe "with valid information" do
    
      before do 
        fill_in "lesson_date", with: "7/7/2013"    
        # fill_in "lesson_time", with: "3:30 PM"
      end
      
      it "should create a lesson" do
        expect { click_button "Schedule" }.to change(Lesson, :count).by(1)
      end
    end
  end
end
