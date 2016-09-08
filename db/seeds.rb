# Create user
1.times do
User.create!(
   email:    "standard@example.com",
   password:  "helloworld"
   )
 end
 user = User.first

# Create Apps
10.times do
   Application.create!(
     user: user,
     name: Faker::App.name,
     url:  Faker::Internet.url
   )
 end
 applications = Application.all

 # Create Events
 25.times do
   event = Event.create!(
     application:  applications.sample,
     name:  Faker::Date.backward(60),
   )
  end
  events = Event.all

 puts "Seed finished"
 puts "#{User.count} user created"
 puts "#{Application.count} applications created"
 puts "#{Event.count} events created"
