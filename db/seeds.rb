# 手動ログインユーザー
User.create!(
  name: 'foo',
  email: 'foo@example.com',
  password: 'foofoo',
  confirmed_at: Time.zone.now
)

100.times do
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    confirmed_at: Time.zone.now
  )
end

User.all.each do |user|
  user.posts.create!(
    content: Faker::Lorem.paragraph_by_chars(number: 50)
  )
end
