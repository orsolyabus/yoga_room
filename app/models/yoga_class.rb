class YogaClass < ApplicationRecord
  validates :title, :description, :duration, presence: true
  # belongs_to :location
  # belongs_to :time_slot
  # belongs_to :user
  # style, class_type ? add once the previous is done
end
