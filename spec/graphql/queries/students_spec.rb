require 'rails_helper'

module Queries
  RSpec.describe Students, type: :request do
    describe '.resolve' do
      it 'returns all students ' do
        user = create(:user, name: "Lee", email: "lee@gmail.com", is_teacher: false)
        create(:user, name: "Stephen", email: "stephen@gmail.com", is_teacher: true)
        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['students']
        
        expect(data).to match_array [
          hash_including(
            'id'          => be_present,
            'name'   => 'Lee',
            'email'    => "lee@gmail.com",
            'isTeacher' => false,
          )
        ]
      end
    end
    
    def query()
      <<~GQL
        query {
          students {
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