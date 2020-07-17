FactoryBot.define do
  factory :user do
    username { "randomusername" }
    email { "someone@gmail.com" }
    password_digest { "password" }
  end
end
