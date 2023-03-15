FactoryBot.define do
  factory :user do
    name { 'bob' }
    sequence(:email) { |n| "text#{n}@example.com" }
    password { 'password' }
  end
end
