require 'rails_helper'

RSpec.describe Location, type: :model do
  describe("validations") do 
    it("requires a country") do
      location = FactoryBot.build(:location, country: nil)
      location.valid?
      expect(location.errors.messages).to have_key :country
    end
    
    it("requires a city") do
      location = FactoryBot.build(:location, city: nil)
      location.valid?
      expect(location.errors.messages).to have_key :city
    end
    
    it("requires a address") do
      location = FactoryBot.build(:location, address: nil)
      location.valid?
      expect(location.errors.messages).to have_key :address
    end
    
  end
  
  describe("geocoding") do
    it("is geocoded") do
      location = FactoryBot.create(:location, city:"richmond", address: "7700 Dampier Dr", country:"Canada", region:"BC")
      expect(location.latitude).to_not be nil
      expect(location.longitude).to_not be nil
    end
  end
  
  describe("relations") do
    it("has many yoga_classes") do
      location = FactoryBot.create(:location)
      yoga_class1 = FactoryBot.create(:yoga_class, location: location)
      yoga_class2 = FactoryBot.create(:yoga_class, location: location)
      expect(location.yoga_classes).to eq [yoga_class1, yoga_class2]
    end
    
    it("belongs to a profile") do
      user = FactoryBot.create(:user)
      profile = FactoryBot.create(:profile, user: user)
      location = FactoryBot.create(:location, profile: profile)
      expect(location.profile).to be_a Profile
    end
  end
end
