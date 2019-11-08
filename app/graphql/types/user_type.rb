module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :name, String, null:false
    field :email, String, null: false
    field :is_teacher, Boolean, null: false
    field :password, String, null: false
  end
end