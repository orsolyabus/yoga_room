class FullProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :intro, :web, :is_teacher, :image_url, :contacts, :public_contact
  
  has_many :yoga_classes
  has_many :locations
end
