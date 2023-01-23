FactoryBot.define do
  factory :user do
    name { 'bob' }
    email { 'text@example.com' }
    password { 'password' }
    after(:create) { |user| user.confirm }
  end
end
