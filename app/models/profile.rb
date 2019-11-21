class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  has_many :yoga_classes, dependent: :destroy
  has_many :locations, dependent: :destroy
end