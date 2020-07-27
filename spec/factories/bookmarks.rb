FactoryBot.define do
  factory :bookmark do
    title { 'Rails Techniques: Using Polymorphic Associations' }
    description { 'Helpful article explaining the how and why for use of polymorphic associations in Rails, has model examples' }
    url { 'https://semaphoreci.com/blog/2017/08/16/polymorphic-associations-in-rails.html' }
    # category_id { 1 }
    # language_id { 1 }
    # user_id { 1 }

    association :user
    association :category
    association :language

    trait :invalid do
      title {nil}
    end
  end
end
