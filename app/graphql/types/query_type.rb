module Types
  class QueryType < BaseObject
    field :users, resolver: Queries::Users
    field :teachers, resolver: Queries::Teachers
    field :students, resolver: Queries::Students
    field :user, resolver: Queries::User
  end
end
