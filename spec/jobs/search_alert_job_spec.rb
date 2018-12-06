require 'rails_helper'

RSpec.describe SearchAlertJob, type: :job do
  describe "#perform_later" do
    it "enques a job" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        SearchAlertJob.perform_later("yoga_class")
      }.to have_enqueued_job
    end
  end

end
