class SearchController < ApplicationController
  def index
    render locals: {
      search_facade: SearchFacade.new(params[:q])
    }
  end
end
