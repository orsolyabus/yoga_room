module Queries
  class Students < Queries::BaseQuery
    description 'Find all Students'

    type [Types::UserType], null: false

    def resolve
      ::User.where(is_teacher: false)
    end
  end
end