class SavedSearch < ApplicationRecord
  validates :name, :user_id, :params, presence: true
  validates :name, uniqueness: {scope: :user_id}

  belongs_to :user
end
