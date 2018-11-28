class Teacher < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  after_validation :titleize_name!
  has_secure_password
  after_validation :update_last_login

  private

  def update_last_login
    self.last_login = Time.now
  end

  def titleize_name!
    self.name = self.name.titleize
  end
end
