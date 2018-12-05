class SearchAlertJob < ApplicationJob
  queue_as :default

  def perform(yoga_class)
    yoga_class = YogaClass.where(id: yoga_class.id)
    searches = SavedSearch.all
    searches.each do |s|
      match = match_yoga_class(yoga_class, s.params)[0]
      if match
        SearchAlertMailer.send_search_alert(s, match).deliver_later
      end
    end
  end

  def match_yoga_class(yoga_class, params)
    result = ApplicationController.helpers.search_this(yoga_class, JSON(params) )
  end

end
