class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 16 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }

  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes_photos, through: :likes, source: :photo
  has_many :comments, dependent: :destroy

  def already_liked?(photo)
    self.likes.exists?(photo_id: photo.id)
  end
end
