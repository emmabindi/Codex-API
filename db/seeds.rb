puts 'Seeding DB..'

User.create(username: 'Henry', email: 'h@gmail.com', password: 'password')
User.create(username: 'Carmen', email: 'c@gmail.com', password: 'password')
User.create(username: 'Zac', email: 'z@gmail.com', password: 'password')
User.create(username: 'Ariana', email: 'a@gmail.com', password: 'password')

puts '4 Users Added'

require_relative "production_seeds"

require_relative "bookmark_seeds"

require_relative "goal_seeds"

require_relative "journal_seeds"

Timer.create(time_length:5000, user_id:1)
Timer.create(time_length:10000, user_id:2)
Timer.create(time_length:660, user_id:3)
Timer.create(time_length:600, user_id:4)

puts "Timers created for users"

puts 'Seed Complete 🎉'
