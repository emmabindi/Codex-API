# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding DB.."
User.create(username:"Harrison", email:"h@gmail.com", password: "password")

puts "User Added"

Category.create(name:"Socials", user_id:1)

puts "Category Added"

Bookmark.create(title:"Handy hints for polymorphic shit", url:"https://cobwwweb.com/rails-has-many-through-polymorphic-association", user_id:1, description:"Time saving tips")

puts "Bookmark added"

Bookmark.first.categories.create(name:"Test Cat", user_id:1)

puts "Added category to a bookmark"

Journal.create(title: "Day 1 of 100 Days of Code", body: "If you're on Twitter and you're even slightly involved in the dev community, there's a chance you've seen the #100DaysOfCode hashtag floating around. As of this first journal entry, I am holding myself accountable to spend 1 hour coding every day for 100 days and to keep a daily log of my learnings, progress, discoveries and questions", user_id:1)

puts "Journal added"

Journal.first.categories.create(name:"Challenge", user_id:1)

puts "Added category to a journal"

Goal.create(
  title: "Implement Styled Components",
  body: "Utilise styled components with a React app for the first time",
  due_date: "2020-09-30",
  completed: true,
  user_id: 1
)
puts "Goal added"

puts "Seed Complete 🎉"