# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")
             #admin:     true,
             #activated: true,
             #activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@debug.com"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password)
              #activated: true,
              #activated_at: Time.zone.now)
end
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  task_title = Faker::Lorem.words(3)
  priority_title = Faker::Lorem.word()
  tag = Faker::Lorem.word()
  rank = 1 + rand(5)
  users.each { |user| user.priority.create!(title: priority_title, rank: rank)}
  users.each { |user| user.tasks.create!(content: content) }
end