FactoryBot.define do
  factory :category do
    categorizable { nil }
    name { "JavaScript" }
  end
end
