FactoryBot.define do
  factory :timer do
    time_length { 300 }
    user_id { 1 }
    association :user
  end
end
