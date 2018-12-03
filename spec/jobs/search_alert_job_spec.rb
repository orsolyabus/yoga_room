require 'rails_helper'

RSpec.describe SearchAlertJob, type: :job do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "#match_yoga_class" do
    it "returns the class if it matches params" do

      yc = FactoryBot.create(:yoga_class, title: "new yoga")
      search = FactoryBot.create(:saved_search, params: {keyword: "new" })
    end

    it "returns nil if class doesn't match params" do

    end

  end

end
