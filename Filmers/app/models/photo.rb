class Photo < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 20 }
  validates :image, presence: true

  has_one_attached :image
  belongs_to :user
end
