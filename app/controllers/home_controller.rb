class HomeController < ApplicationController

  def index
  end

  def contact
    @issue = Issue.new
  end

  def privacy
  end
  
  def terms
  end
    
  private

  
end
