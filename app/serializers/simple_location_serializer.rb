class SimpleLocationSerializer < ActiveModel::Serializer
  attributes :id, :location_list_view
  belongs_to :profile
  has_many :yoga_classes
end
