class SearchesController < ApplicationController
  def show
    @routes = Route.search(params)
    @railway_stations = RailwayStation.all
  end
end
