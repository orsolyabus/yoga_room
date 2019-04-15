class Location < ApplicationRecord
  
  validates :country, :city, :address, presence: true
  validates :address, uniqueness: {scope: :city,  message: "This location already exists"}
  geocoded_by :full_address
  before_save :geocode, :if => :address_changed?
  has_many :yoga_classes, dependent: :nullify

  def location_list_view
    "#{studio}, #{address}, #{city} #{region}"
  end
  
  private
  
  def full_address
    "#{address}, #{city}, #{region}, #{country}"
  end
end
