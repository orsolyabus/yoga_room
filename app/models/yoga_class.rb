class YogaClass < ApplicationRecord
  validates :title, :description, :location_id, presence: true
  belongs_to :profile 
  belongs_to :location
  
  has_one :schedule, dependent: :destroy

  accepts_nested_attributes_for :schedule
  # style,? add once the previous is done

  include PgSearch

  pg_search_scope :search_for, against: %i(title description)
  pg_search_scope :search_content_for, against: :content, using: { tsearch: { any_word: true } }
end
