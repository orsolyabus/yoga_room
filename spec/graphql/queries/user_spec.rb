require 'rails_helper'

module Queries
  RSpec.describe User, type: :request do
    describe '.resolve' do
      it 'returns user for provided id' do
        user = create(:user, name: "Lee", email: "lee@gmail.com", is_teacher: false)
        
        post '/graphql', params: { query: query(id: user.id) }

        json = JSON.parse(response.body)
        data = json['data']['user']
        
        expect(data).to include(
          'id'          => be_present,
          'name'   => 'Lee',
          'email'    => "lee@gmail.com",
          'isTeacher' => false,
        )
      end
    end
    
    def query(id:)
      <<~GQL
        query {
          user(id: #{id}) {
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