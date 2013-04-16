# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  date_time  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Lesson do
  
  let(:user) { FactoryGirl.create(:user) }
  before do 
    @lesson = user.lessons.build(date: DateTime.now.to_date)
  end
  
  subject { @lesson }
  
  it { should respond_to(:user_id) }
  it { should respond_to(:date_time) }
  it { should respond_to(:date) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
    
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Lesson.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
    
    it "should not allow access to date_time" do
      expect do
        Lesson.new(date_time: DateTime.new)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "when user_id is not present" do
    before { @lesson.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank date" do
    before { @lesson.date = nil }
    it { should_not be_valid }
  end  

end
