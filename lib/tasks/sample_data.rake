namespace :db do

  desc "Fill database with sample data" 
  task populate: :environment do
  
    ActiveRecord::Base.transaction do # beginning of transaction
  
      # Create an admin user
      puts "---=== Creating an admin user ===---"
      admin = User.create!(name: "Example User",
        email: "example@railstutorial.org",
        password: "foobar",
        password_confirmation: "foobar")
      admin.toggle!(:admin)
      
      # Create regular users
      puts "---=== Creating regular users ===---"
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
      puts "---=== Creating lessons for users ===---"
      users = User.all(limit: 6)    
      users.each do |user|
        50.times do |n|
          date = DateTime.now.to_date + n.days
          user.lessons.create!(date: date)
        end
      end
    
    end # end of transaction
    
  end
end