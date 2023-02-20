FactoryBot.define do
  factory :user do
    name { 'bob' }
    sequence(:email) { |n| "text#{n}@example.com" }
    password { 'password' }
    after(:create, &:confirm)
  end
end
