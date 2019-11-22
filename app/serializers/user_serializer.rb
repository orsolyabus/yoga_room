class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :is_teacher, :default_country
  has_one :profile
end
