class Location < ApplicationRecord
  
  validates :country, :city, :address, presence: true
  validates :address, uniqueness: {scope: :city,  message: "this location already exists"}
  
  has_many :yoga_classes
end
