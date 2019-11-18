class Location < ApplicationRecord
  
  validates :country, :city, :address, presence: true
  geocoded_by :full_address
  before_save :geocode, :if => :address_changed?
  has_many :yoga_classes
  belongs_to :profile

  def location_list_view
    "#{studio}, #{address}, #{city} #{region}"
  end
  
  private
  
  def full_address
    "#{address}, #{city}, #{region}, #{country}"
  end
end
