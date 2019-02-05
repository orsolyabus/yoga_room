class HomeController < ApplicationController

  def index
  end

  def contact
    @issue = Issue.new
  end

  private

  
end
