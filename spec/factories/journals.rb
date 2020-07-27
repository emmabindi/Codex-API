FactoryBot.define do
  factory :journal do
    title { 'Day 1 of 100 Days of Code' }
    body { "If you're on Twitter and you're even slightly involved in the dev community, there's a chance you've seen the #100DaysOfCode hashtag floating around. As of this first journal entry, I am holding myself accountable to spend 1 hour coding every day for 100 days and to keep a daily log of my learnings, progress, discoveries and questions" }

    association :user
    association :category
    association :language
  end
end
