class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :content, presence: true, length: { maximum: 140 }

  validates :image, content_type: %w[image/png image/jpeg], size: { less_than: 5.megabytes }

  scope :default_order, -> { order(created_at: :desc, id: :asc) }

  def display_image
    image.variant(resize_to_limit: [100, 100])
  end
end
