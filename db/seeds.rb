# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:"Test Choice",
 email:'admin@choice.com',
 password:"asdf123", 
 password_confirmation:"asdf123",
 roles: "admin"
 )

User.create!(
  email: "test1@test.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  name: "Regular User",
)

puts "1 regular & 1 admin user created"


10.times do |blog|
    Blog.create!(title: "School Blog", body: "Laboris nisi ut aliquip ex ea commodo consequat. Duis aute
    irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non 
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum This is a test blog education block 1")
end

puts "10 blogs created"


    Skill.create!(
        title: "Afternoon Class",
         percent_utilized: 60)
 

    Skill.create!(
        title: "Morning Class",
     percent_utilized: 100)


puts "2 Skills created"

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
    aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
    irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non 
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    main_image: "http://placehold.it/600x400", 
    thumb_image: "http://placehold.it/350x200"
    )
end

puts "9 portfolio items created"

6.times do |posts|
  Post.create!(
    name: "Choice Test",
    title: "Choice Posts",
    age: "3",
    class_desired: "morning",
    body: "Best Time for Me"
 )
end 

6.times do |posts|
  Post.create!(
    name: "Choice Test",
    title: "Choice Posts",
    age: "3",
    class_desired: "afternoon",
    body: "Best Time for Me"
 )
end

puts "12 Posts created"

ClassRoster.create!(title: "Morning Class",
subtitle: "Schedule: 9:15-11:45",
count: "12",
description: "Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith",
status: "Active")

ClassRoster.create!(title: "Afternoon Class",
subtitle: "Schedule: 12:30-3:00",
count: "12",
description: "Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith Johnny, Carsons Sally, Smith",
status: "Active")

puts "2 classes created morn/aft"