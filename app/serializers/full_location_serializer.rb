class FullLocationSerializer < ActiveModel::Serializer
  attributes :id, :country, :city, :address, :studio, :region
  
  belongs_to :profile
  has_many :yoga_classes
end
