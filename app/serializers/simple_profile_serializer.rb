class SimpleProfileSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :yoga_classes
  has_many :locations
end
