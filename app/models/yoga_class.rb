class YogaClass < ApplicationRecord
  validates :title, :description,   presence: true
  belongs_to :user
  belongs_to :location
  
  has_one :schedule, dependent: :destroy

  accepts_nested_attributes_for :schedule
  # style,? add once the previous is done
end
