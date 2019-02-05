class Issue < ApplicationRecord
  validates :subject, :message, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :sender, presence: true, format: VALID_EMAIL_REGEX
end
