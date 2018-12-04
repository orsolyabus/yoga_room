class DailySearchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # get the new yoga classes from the last day.
    now = Time.now.beginning_of_hour
    yoga_classes = YogaClass.where(created_at: now - 24.hours)..now)
    # run them through the saved searches.
      # get the searches per user
      searches = SavedSearch.all.group_by(&:user_id)
      # collect the matching classes
    # send email to users
  end
end
