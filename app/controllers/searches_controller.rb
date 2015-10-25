class SearchesController < ApplicationController
  def show
    @routes = Route.search(params)
  end
end
