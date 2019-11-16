class User < ApplicationRecord
 
  validates :name, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,  format: VALID_EMAIL_REGEX

  has_one :profile, dependent: :destroy
  has_secure_password
  has_many :saved_searches, dependent: :destroy
  has_many :messages, class_name: "Ahoy::Message", as: :user
end
