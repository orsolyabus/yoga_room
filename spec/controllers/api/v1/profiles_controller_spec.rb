require 'rails_helper'

RSpec.describe Api::V1::ProfilesController, type: :controller do
  describe "#teachers" do

    it "response with json" do
      user1 = FactoryBot.create(:profile, is_teacher: false)
      teacher = FactoryBot.create(:profile, is_teacher: true)
      get(:teachers)
      expect(response.content_type).to eq("application/json")
    end
    
  end

end
