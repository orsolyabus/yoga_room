require 'rails_helper'

module Queries
  RSpec.describe Users, type: :request do
    describe '.resolve' do
      it 'returns all users ' do
        user = create(:user, name: "Lee", email: "lee@gmail.com", is_teacher: false)
        create(:user, name: "Stephen", email: "stephen@gmail.com", is_teacher: true)
        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['users']
        
        expect(data).to match_array [
          hash_including(
          'id'          => be_present,
          'name'   => 'Lee',
          'email'    => "lee@gmail.com",
          'isTeacher' => false,
          ),
          hash_including(
          'id'          => be_present,
          'name'   => 'Stephen',
          'email'    => "stephen@gmail.com",
          'isTeacher' => true,
          )
        ]
      end
    end
    
    def query()
      <<~GQL
        query {
          users {
            id
            name
            email
            isTeacher
          }
        }
      GQL
    end
  end
end