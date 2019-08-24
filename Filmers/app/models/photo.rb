class Photo < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :title, length: { maximum: 20 }
end
