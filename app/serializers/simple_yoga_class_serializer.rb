class SimpleYogaClassSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :schedule
  belongs_to :location
  belongs_to :profile
end
