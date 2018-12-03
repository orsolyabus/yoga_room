class SearchAlertJob < ApplicationJob
  queue_as :default

  def perform(yoga_class)
    puts "--------------------"
    puts " Running a job... 🖖"
    yc = YogaClass.where(id: yoga_class.id)
    searches = SavedSearch.all
    searches.each do |s|
      match = match_yoga_class(yc, s.params)[0]
      if match
         puts "send email"
      else
        puts "no email"
      end
    end
        
  end

  def match_yoga_class(yc, params)
    result = ApplicationController.helpers.search_this(yc, JSON(params) )
    puts "--------------------"
    p result
  end

end
