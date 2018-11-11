require 'rails_helper'

RSpec.describe YogaClass, type: :model do
  describe "validations" do
    it "must have a title, description, class_type, duration, country, city, address, day, time"
    it "class type can only be:  weekly class, course, workshop, retreet, camp, teacher training"
    it "a yoga class belongs to one style"
    # it " has one location"
    # it "has one time slot"

    
  end
end
