namespace :db do

  desc "Fill database with sample data" 
  task populate: :environment do
  
    ActiveRecord::Base.transaction do # beginning of transaction
  
      # Create private lesson package types
      puts "---=== Creating private lesson package types ===---"
      private_lesson_package_type_hashes =
        [ { name: "1 private lesson",
            duration_in_minutes: 45,
            cost_in_dollars: 85 },
          { name: "3 lesson pack",
            duration_in_minutes: 45,
            cost_in_dollars: 240 },
          { name: "5 lesson pack",
            duration_in_minutes: 45,
            cost_in_dollars: 375 },
          { name: "10 lesson pack",
            duration_in_minutes: 45,
            cost_in_dollars: 700 },
          { name: "Private golf school",
            duration_in_minutes: 240,
            cost_in_dollars: 200 } ]
      private_lesson_package_type_hashes.each do |hash|
        PrivateLessonPackageType.create(hash)
      end

      # Create an admin user
      puts "---=== Creating an admin user ===---"
      admin = User.create!(name: "George Johnson",
        email: "golf@gfjohnson.com",
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
      users = User.where("admin = ?", false).limit(6)    
      users.each do |user|
        10.times do |n|
          date = DateTime.now.to_date + n.days
          user.lessons.create!(date_string: "#{date.month}/#{date.day}/#{date.year}")
        end
      end
    
    end # end of transaction
    
  end
end
