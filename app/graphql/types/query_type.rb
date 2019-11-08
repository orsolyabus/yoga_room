module Types
  class QueryType < BaseObject
    field :all_users, [UserType], null: false do
      description 'Find all users'
    end
    field :all_teachers, [UserType], null: false do
      description 'Find all teachers'
    end
    field :all_students, [UserType], null: false do
      description 'Find all students'
    end
    field :user, UserType, null: false do
      description 'Find a user by id'
      argument :id, ID, required: true
    end
    
    def all_users
      User.all
    end
    def all_teachers
      User.where(is_teacher: true)
    end
    def all_students
      User.where(is_teacher: false)
    end
    def user(id:)
      User.find(id)
    end
    
  end
end
