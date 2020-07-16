# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username:"Harrison", email:"h@gmail.com", password: "password")

Bookmark.create(title:"Handy hints for polymorphic shit", url:"https://cobwwweb.com/rails-has-many-through-polymorphic-association", user_id:1, description:"Life saving tips")