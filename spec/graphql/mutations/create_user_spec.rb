require 'rails_helper'

module Mutations
  RSpec.describe CreateUser, type: :request do
    describe '.resolve' do
      it 'creates a User' do
        expect do
          post '/graphql', params: { query: query() }
        end.to change { User.count }.by(1)
      end

      it 'returns a User' do
        post '/graphql', params: { query: query() }
        json = JSON.parse(response.body)
        data = json['data']['createUser']

        expect(data).to include(
          'id' => be_present,
          'name' => 'test student',
          'email' => "newtest@gmail.com",
          'isTeacher' => false,
        )
      end
    end

    def query()
      <<~GQL
        mutation{
          createUser(
          name: "test student"
          email: "newtest@gmail.com"
          isTeacher: false,
          password: "secret"
          ){
            email
            id
            isTeacher
            name
          }
        }
      GQL
    end
  end
end
