class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_teacher
  has_one :info
end
