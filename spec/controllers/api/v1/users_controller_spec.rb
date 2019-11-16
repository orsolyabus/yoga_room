require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  
  describe "#teachers" do

    it "response with json" do
      user1 = FactoryBot.create(:user, is_teacher: false)
      teacher = FactoryBot.create(:user, is_teacher: true)
      get(:teachers)
      expect(response.body).to eq([teacher].to_json)
      expect(response.content_type).to eq("application/json")
    end
    
  end

end
