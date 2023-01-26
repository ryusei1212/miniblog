class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :profile, length: { maximum: 200 }
end
