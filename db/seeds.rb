# 手動ログインユーザー
User.create!(
  name: 'foo',
  email: 'foo@example.com',
  password: 'foofoo'
)

30.times do
  User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password'
  )
end

@user = User.first
30.times do
  @user.posts.create!(
    content: Faker::Lorem.paragraph_by_chars(number: 50)
  )
end

User.all.each do |user|
  user.posts.create!(
    content: Faker::Lorem.paragraph_by_chars(number: 50)
  )
end

users = User.all
posts = Post.all

posts.each do |post|
  rand(1..30).times do
    post.likes.create(user: users.sample, created_at: '2023-03-16 12:34:56')
  end
end
