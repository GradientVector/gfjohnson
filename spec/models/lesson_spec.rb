require 'spec_helper'

describe Lesson do
  
  let(:user) { FactoryGirl.create(:user) }
  before do 
    @lesson = user.lessons.build(occurs_at_date: DateTime.now.to_date, 
      occurs_at_time: DateTime.now.to_time)
  end
  
  subject { @lesson }
  
  it { should respond_to(:user_id) }
  it { should respond_to(:occurs_at_date) }
  it { should respond_to(:occurs_at_time) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
    
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Lesson.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  describe "when user_id is not present" do
    before { @lesson.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank occurs at date" do
    before { @lesson.occurs_at_date = nil }
    it { should_not be_valid }
  end  
  
  describe "with blank occurs at time" do
    before { @lesson.occurs_at_time = nil }
    it { should_not be_valid }
  end
end
