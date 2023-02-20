class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User' # class_nameを省略すると => followerクラスと自分のfollower_idを紐づけることになる
  belongs_to :followed, class_name: 'User'
end
