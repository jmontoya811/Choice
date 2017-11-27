# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |blog|
    Blog.create!(title: "School Blog", body: "This is a test blog education block 1")
end

puts "10 blogs created"

2.times do |skills|
    Skill.create!(title: "Afternoon Class", percent_utilized: "60")
    Skill.create!(title: "Morning Class", percent_utilized: "100")
end