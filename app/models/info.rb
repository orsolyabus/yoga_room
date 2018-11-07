class Info < ApplicationRecord
  belongs_to :user
  # delegate :teacher, to: :user
end
