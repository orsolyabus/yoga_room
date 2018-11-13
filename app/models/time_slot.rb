class TimeSlot < ApplicationRecord
  
  # has_many :yoga_classes

  validates :day, :time, presence: true
  validates :time, uniqueness: {scope: :day, message: "this time slot already exists"}
end
