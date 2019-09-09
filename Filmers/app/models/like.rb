class Like < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  validates_uniqueness_of :photo_id, scope: :user_id
end
