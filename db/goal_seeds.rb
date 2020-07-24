80.times do 
  Goal.create(
    title: Faker::Lorem.sentence(word_count: 6),
    body: Faker::Lorem.paragraph(sentence_count: 3),
    due_date: Faker::Date.between(from: Date.today, to: '2014-09-25'),
    completed: false,
    user_id: Faker::Number.within(range: 1..4),
    category_id: Faker::Number.within(range: 1..15), 
    language_id: Faker::Number.within(range: 1..26)
  )
end

Goal.create(
  title: 'Implement Styled Components',
  body: 'Utilise styled components with a React app for the first time',
  due_date: '2020-09-30',
  completed: false,
  user_id: 1,
  category_id: 1, 
  language_id: 1
)

Goal.create(
  title: 'Learn Redux',
  body: 'Complete online tutorial',
  due_date: '2020-08-25',
  completed: true,
  completed_date: '2020-08-10',
  user_id: 1,
  category_id: 6, 
  language_id: 1
)

Goal.create(
  title: 'Prepare Interview Answers',
  body: 'Behavioural STAR examples and reserch creative questions',
  due_date: '2020-06-25',
  completed: true,
  completed_date: '2020-06-10',
  user_id: 1,
  category_id: 14, 
  language_id: 26
)

Goal.create(
  title: 'Create a Pomodoro Clock',
  body: 'To structure my work day and remind me to take breaks to stretch my eyes and also git commit my work',
  due_date: '2020-12-10',
  completed: false,
  user_id: 1,
  category_id: 1, 
  language_id: 1
)

Goal.create(
  title: 'Complete FreeCodeCamp D3 Course',
  body: '13 hour course to learn data visualization with D3/JS',
  due_date: '2020-07-31',
  completed: true,
  completed_date: '2020-08-01',
  user_id: 1,
  category_id: 6, 
  language_id: 1
)

puts 'Goals added'

goals = Goal.all 

goals.each do | goal |
  goal.update_attribute(:created_at, (rand*28).days.ago)
end