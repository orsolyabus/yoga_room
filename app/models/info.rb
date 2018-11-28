class Info < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  has_one_attached :image
end
