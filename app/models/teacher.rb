class Teacher < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  after_validation :update_last_login

  private

  def update_last_login
    self.last_login = Time.now
  end
end
