class User < ApplicationRecord
  self.inheritance_column = :user_type
  # has_secure_password
  def self.user_types
    %w(Teacher Student)
  end

end

