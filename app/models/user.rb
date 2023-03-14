class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: { maximum: 20 } # TODO: seedでデータを作成する際に条件が厳しするぎるため format: { with: /\A[a-zA-Z]+\z/ }
  validates :profile, length: { maximum: 140 }

  scope :default_order, -> { order(created_at: :desc) }

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy!
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def like?(post)
    likes.exists?(post:)
  end
end
