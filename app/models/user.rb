class User < ApplicationRecord
 
  validates :name, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,  format: VALID_EMAIL_REGEX

  has_one :info
  has_secure_password
  has_many :yoga_classes
end
