class User < ApplicationRecord
  has_one :info
  has_secure_password

  validates :name, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,  format: VALID_EMAIL_REGEX
  
  self.inheritance_column = :user_type

  scope :teachers, -> {where(user_type: 'Teacher')}
  scope :students, -> {where(user_type: 'Student')}

  def self.user_types
    %w(Student Teacher)
  end

end

