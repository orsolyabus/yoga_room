class FullYogaClassSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  
  has_one :schedule
  belongs_to :location
  belongs_to :profile
end
