namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    # Create an admin user
    admin = User.create!(name: "Example User",
      email: "example@railstutorial.org",
      password: "foobar",
      password_confirmation: "foobar")
    admin.toggle!(:admin)
    
    # Create regular users
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name: name,
        email: email,
        password: password,
        password_confirmation: password)
    end
    
    # Create lessons for users
    users = User.all(limit: 6)    
    users.each do |user|
      50.times do |n|
        datetime = DateTime.now + n.hours
        user.lessons.create!(occurs_at_date: datetime.to_date, occurs_at_time: datetime.to_time)
      end
    end
  end
end