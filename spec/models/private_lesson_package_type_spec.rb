require 'spec_helper'

describe PrivateLessonPackageType do

  let(:private_lesson_package_type) do
    FactoryGirl.create(:private_lesson_package_type)
  end

  subject { private_lesson_package_type }

  it { should respond_to(:name) }
  it { should respond_to(:duration_in_minutes) }
  it { should respond_to(:cost_in_dollars) }

  it { should be_valid }

end
