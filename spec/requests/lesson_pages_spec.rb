require 'spec_helper'

describe "Lesson pages" do

  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "lesson creation" do
    before { visit new_lesson_path }
    
    describe "with blank date" do
      before { fill_in "lesson_date_string", with: " " }
      
      it "should not create a lesson" do
        expect { click_button "Schedule" }.not_to change(Lesson, :count)
      end
      
      describe "error messages" do
        before { click_button "Schedule" }
        it { should have_content("error") }
      end    
    end
    
    describe "with past date" do
      before do 
        date = 1.day.ago
        fill_in "lesson_date_string", with: convert_date_to_string(date)
      end
      
      it "should not create a lesson" do
        expect { click_button "Schedule" }.not_to change(Lesson, :count)
      end
      
      describe "error messages" do
        before { click_button "Schedule" }
        it { should have_content("error") }
      end
    end
    
    describe "with today's date" do
      before do
        date = DateTime.now
        fill_in "lesson_date_string", with: convert_date_to_string(date) 
      end
      
      it "should not create a lesson" do
        expect { click_button "Schedule" }.not_to change(Lesson, :count)
      end
      
      describe "error messages" do
        before { click_button "Schedule" }
        it { should have_content("error") }
      end
    end
    
    describe "with tomorrow's date" do
      before do
        date = 1.day.from_now
        fill_in "lesson_date_string", with: convert_date_to_string(date)
      end
      
      it "should create a lesson" do
        expect { click_button "Schedule" }.to change(Lesson, :count).by(1)
      end   
    end
    
    describe "with a date one year from now" do
      before do
        date = 1.year.from_now
        fill_in "lesson_date_string", with: convert_date_to_string(date)
      end
      
      it "should create a lesson" do
        expect { click_button "Schedule" }.to change(Lesson, :count).by(1)
      end
    end
    
    describe "with a date more than one year from now" do
      before do
        date = 1.year.from_now + 1.day
        fill_in "lesson_date_string", with: convert_date_to_string(date)
      end
      
      it "should not create a lesson" do
        expect { click_button "Schedule" }.not_to change(Lesson, :count)
      end
            
      describe "error messages" do
        before { click_button "Schedule" }
        it { should have_content("error") }
      end
    end
  end
  
  describe "lesson destruction" do
    before { FactoryGirl.create(:lesson, user: user) }
    
    describe "as correct user" do
      before { visit root_path }
      
      it "should delete a lesson" do
        expect { click_link "cancel" }.to change(Lesson, :count).by(-1)
      end
    end
  end
  
end
