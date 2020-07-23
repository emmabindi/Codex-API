50.times do 
  Bookmark.create(
    title: Faker::Lorem.sentence(word_count: 4),
    url: Faker::Internet.url,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    user_id: Faker::Number.within(range: 1..4),
    category_id: Faker::Number.within(range: 1..15), 
    language_id: Faker::Number.within(range: 1..26)
  )
end

Bookmark.create(title: 'Polymorphic associations article', url: 'https://cobwwweb.com/rails-has-many-through-polymorphic-association', user_id: 2, description: 'Handy hints for polymorphic associations', category_id:1, language_id: 8);

Bookmark.create(title: 'How to Properly Test a Rails API with Rspec', url: 'https://medium.com/@sedwardscode/how-to-properly-test-a-rails-api-with-rspec-f15cbe1dfd11', user_id: 1, description: 'How to write tests for GET, POST, PUT, DELETE for Rails API', category_id:11, language_id:9)

Bookmark.create(title: 'Ruby Arrays Cheatsheet', url: 'https://www.shortcutfoo.com/app/dojos/ruby-arrays/cheatsheet', user_id: 1, description: 'Summary and description for lots of ruby array methods', category_id:4, language_id:9)

Bookmark.create(title: 'HTML Cheatsheet', url: 'https://htmlcheatsheet.com/', user_id: 1, description: 'Fun interface for understanding HTML', category_id:1, language_id:23)

Bookmark.create(title: 'Syntax Podcast', url: 'https://overcast.fm/+JaI55hXNA', user_id: 1, description: 'Podcast suggested by Harrison misc web development topics', category_id:12, language_id:26)

Bookmark.create(title: 'Common Weakness Emuneration', url: 'http://cwe.mitre.org/data/definitions/699.html', user_id: 1, description: 'List of software and hardware weakness types, a measuring stick for security tools, and as a baseline for weakness identification, mitigation, and prevention efforts.', category_id: 7, language_id:26)

bookmarks = Bookmark.all 

bookmarks.each do | bookmark |
  bookmark.update_attribute(:created_at, (rand*10).days.ago)
end

puts 'Bookmarks added'