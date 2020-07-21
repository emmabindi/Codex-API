puts 'Seeding DB..'
User.create(username: 'Henry', email: 'h@gmail.com', password: 'password')
User.create(username: 'Carmen', email: 'h@gmail.com', password: 'password')
User.create(username: 'Zac', email: 'h@gmail.com', password: 'password')
User.create(username: 'Ariana', email: 'h@gmail.com', password: 'password')

puts '4 Users Added'

Category.create(name:"Front End")
Category.create(name:"Back End")
Category.create(name:"Logic")
Category.create(name:"Functional")
Category.create(name:"Object Orientated")
Category.create(name:"Data Analytics")
Category.create(name:"Secure Development")
Category.create(name:"Tools")
Category.create(name:"Project Ideas")
Category.create(name:"Network & Internet")
Category.create(name:"Other")

Bookmark.create(title: 'Polymorphic associations article', url: 'https://cobwwweb.com/rails-has-many-through-polymorphic-association', user_id: 1, description: 'Handy hints for polymorphic associations', category_id:1;

sleep 1

Bookmark.create(title: 'How to Properly Test a Rails API with Rspec', url: 'https://medium.com/@sedwardscode/how-to-properly-test-a-rails-api-with-rspec-f15cbe1dfd11', user_id: 1, description: 'How to write tests for GET, POST, PUT, DELETE for Rails API')

sleep 1

Bookmark.create(title: 'Ruby Arrays Cheatsheet', url: 'https://www.shortcutfoo.com/app/dojos/ruby-arrays/cheatsheet', user_id: 1, description: 'Summary and description for lots of ruby array methods')

sleep 1

Bookmark.create(title: 'HTML Cheatsheet', url: 'https://htmlcheatsheet.com/', user_id: 1, description: 'Fun interface for understanding HTML')

sleep 1

Bookmark.create(title: 'Syntax Podcast', url: 'https://overcast.fm/+JaI55hXNA', user_id: 1, description: 'Podcast suggested by Harrison misc web development topics')

sleep 1

Bookmark.create(title: 'Common Weakness Emuneration', url: 'http://cwe.mitre.org/data/definitions/699.html', user_id: 1, description: 'List of software and hardware weakness types, a measuring stick for security tools, and as a baseline for weakness identification, mitigation, and prevention efforts.')

puts 'Bookmarks added'

Goal.create(
  title: 'Implement Styled Components',
  body: 'Utilise styled components with a React app for the first time',
  due_date: '2020-09-30',
  completed: false,
  user_id: 1,
  category_id: 1
)

sleep 1

# Goal.create(
#   title: 'Create a Pomodoro Clock',
#   body: 'To structure my work day and remind me to take breaks to stretch my eyes and also git commit my work',
#   due_date: '2020-12-10',
#   completed: false,
#   user_id: 1
# )

# sleep 1

# Goal.create(
#   title: 'Complete FreeCodeCamp D3 Course',
#   body: '13 hour course to learn data visualization with D3/JS',
#   due_date: '2020-07-31',
#   completed: true,
#   user_id: 1
# )

# puts '3 Goals added'

Journal.create(title: 'Day 1 of 100 Days of Code', body: "If you're on
  Twitter and you're even slightly involved in the dev community,
  there's a chance you've seen the #100DaysOfCode hashtag floating around.
  As of this first journal entry, I am holding myself accountable
  to spend 1 hour coding every day for 100 days and to keep a daily
  log of my learnings, progress, discoveries and questions", category_id: 1, user_id: 1)

sleep 1

# Journal.create(title: 'Pomodoro clock', body: 'The Pomodoro Technique is
#    a time-management framework which is as simple as it is effective -
#    you use a timer to break your work into time blocks (usually 25
#     minutes), separated by a 5 minute break. After every 4 pomodoros, you
#      can take a longer break. I am going to build my own Pomodoro clock
#      so that: I can start a 25 minute pomodoro, and the timer
#      will go off once 25 minutes has elapsed. I can reset the clock
#      for my next pomodoro. I can customise the length of each
#       pomodoro. ', user_id: 1, category: 'Challenge')

# sleep 1

# Journal.create(title: 'Regex on the brain', body: "Today I completed a
#   coding challenge for a job application which required my to use Regex
#   to solve the problem. I've realised I NEED MORE REGEX PRACTISE, so I
#   have started to search for some online tutorials to stretch my skills.
#    It's like a language all in itself. I've created a HackerRank account
#     to test some challenges", user_id: 1)

# sleep 1

# Journal.create(title: 'Big O', body: "Saw an article on Twitter which
#   prompted me to refresh my knowledge of CS fundamentals. Big O notation
#   is used in Computer Science to describe the performance or complexity
#   of an algorithm. Big O specifically describes the worst-case scenario,
#   and can be used to describe the execution time required or the space
#   used by an algorithm.\n", user_id: 1)

# sleep 1

# Journal.create(title: 'Today I learnt Ruby Stacks', body: 'A stack is a
#   data structure which you can use as a “to-do” list. You keep taking
#   elements from the stack & processing them until the stack is empty. The
#    big thing to notice here is that new items are added to the top of the
#     stack. In a “Last-In First-Out” (LIFO) fashion. Meaning that when you
#      take (pop) an item from the stack, it will be the last item that was
#      pushed into it. I used Ruby stacks to solve my Daily Coding
#      Problem', user_id: 1)

# sleep 1

# Journal.create(title: 'Day 6', body: "Lorem Ipsum is simply dummy text of
#    the printing and typesetting industry. Lorem Ipsum has been the
#    industry's standard dummy text ever since the 1500s, when an unknown
#    printer took a galley of type and scrambled it to make a type specimen
#     book. It has survived not only five centuries, but also the leap into
#     electronic typesetting, remaining essentially unchanged. It was
#     popularised in the 1960s with the release of Letraset sheets
#     containing Lorem Ipsum passages, and more recently with desktop
#     publishing software like Aldus PageMaker including versions of Lorem
#     Ipsum.", user_id: 1)

# puts '6 Journals added'

puts 'Seed Complete 🎉'
