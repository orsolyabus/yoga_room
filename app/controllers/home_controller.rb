class HomeController < ApplicationController

  def index
  end

  def search
    @params = params
    @search_params = helpers.get_search_params(params)
    @search_result = helpers.search(@search_params)
  end

  private

  
end
