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
    datetime = DateTime.now
    sequence(:occurs_at_date) { |n| (datetime + n.hours).to_date }
    sequence(:occurs_at_time) { |n| (datetime + n.hours).to_time }
    user
  end
end