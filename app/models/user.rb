class User < ApplicationRecord
  self.inheritance_column = :user_type
  # has_secure_password

  scope :teachers, -> {where(user_type: 'Teacher')}
  scope :students, -> {where(user_type: 'Student')}

  def self.user_types
    %w(Teacher Student)
  end

  def talk 
    raise 'Abstract Method' 
  end

end

