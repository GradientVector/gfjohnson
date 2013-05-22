FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "foobar"
		password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
	end
  
  factory :lesson do
  
    sequence(:date_string) do |n| 
      date = DateTime.now + n.days
      "#{date.month}/#{date.day}/#{date.year}"
    end
    
    user
  end

  factory :private_lesson_package_type do
    sequence(:name) { |n| "Private Lesson Package #{n}" }
    duration_in_minutes 45
    cost_in_dollars 100
  end
end
