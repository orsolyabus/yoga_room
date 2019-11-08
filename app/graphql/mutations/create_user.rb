module Mutations
  class CreateUser < BaseMutation
    # arguments passed to the `resolved` method
    argument :name, String, required: true
    argument :email, String, required: true
    argument :is_teacher, Boolean, required: true
    argument :password, String, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(name: nil, email: nil, is_teacher: false, password: nil)
      User.create!(
        name: name,
        email: email,
        is_teacher: is_teacher,
        password: password,
      )
    end
  end
end