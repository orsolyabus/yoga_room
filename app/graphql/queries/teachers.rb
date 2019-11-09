module Queries
  class Teachers < Queries::BaseQuery
    description 'Find all Teachers'

    type [Types::UserType], null: false

    def resolve
      ::User.where(is_teacher: true)
    end
  end
end