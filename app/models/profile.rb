class Profile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  has_many :yoga_classes, dependent: :destroy
  has_many :locations, dependent: :destroy
  
  def contacts
    if self.public_contact
      return {
        phone: self.phone,
        contact: self.contact
      }
    end
  end
  
end
