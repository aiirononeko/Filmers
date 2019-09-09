class Photo < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 20 }

  has_one_attached :image
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :likes_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
end
