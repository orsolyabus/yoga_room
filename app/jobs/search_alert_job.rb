class SearchAlertJob < ApplicationJob
  queue_as :default

  def perform(yoga_class)
    yoga_class = YogaClass.where(id: yoga_class.id)
    all_searches = SavedSearch.all.group_by(&:user_id)
    all_searches.each_pair do |user_id, searches|
      matching_searches = searches.select{|search| match_yoga_class(yoga_class, search.params)[0]}
      if matching_searches.length > 0
        SearchAlertMailer.send_search_alert(user_id, matching_searches, yoga_class[0]).deliver_later
      end

    end
  end

  def match_yoga_class(yoga_class, params)
    result = ApplicationController.helpers.search_this(yoga_class, JSON(params) )
  end

end
