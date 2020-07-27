FactoryBot.define do
  factory :user do
    username { 'randomuser' }
    email { 'random@gmail.com' }
    password_digest { '111111' }
  end
end
