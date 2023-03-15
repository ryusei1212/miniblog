# 手動ログインユーザー
User.create!(
  name: 'foo',
  email: 'foo@example.com',
  password: 'foofoo'
)

50.times do
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password'
  )
end

@user = User.first
50.times do
  @user.posts.create!(
    content: Faker::Lorem.paragraph_by_chars(number: 50)
  )
end

User.all.each do |user|
  user.posts.create!(
    content: Faker::Lorem.paragraph_by_chars(number: 50)
  )
end
