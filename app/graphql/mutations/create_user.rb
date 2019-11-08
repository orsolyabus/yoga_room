module Mutations
  class CreateUser < BaseMutation
    # arguments passed to the `resolved` method
    argument :name, String, required: true
    argument :email, String, required: true
    argument :is_teacher, Boolean, required: true
    argument :password, String, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(**attributes)
      User.create!(**attributes)
    end
  end
end