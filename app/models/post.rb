class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: { maximum: 140 }

  scope :default_order, -> { order(created_at: :desc) }
end
