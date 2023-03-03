class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, presence: true, length: { maximum: 140 }

  scope :default_order, -> { order(created_at: :asc) }
end
