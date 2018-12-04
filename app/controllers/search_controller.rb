class SearchController < ApplicationController
  def index
    current_user.reset_search_people
  end
end
