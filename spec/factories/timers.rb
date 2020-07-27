FactoryBot.define do
  factory :timer do
    time_length { 300 }
    association :user
  end
end
