class Photo < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 20 }

  has_one_attached :image
  belongs_to :user
end
