class RailwayStation < ActiveRecord::Base
  has_many :route_stations
  has_many :routes, through: :route_stations

  validates :title, presence: true

  def update_position(route, order)
    route_station = route_station_by_route(route)
    route_station.order = order
    route_station.save
    route.save
  end

  def position(route)
    route_station_by_route(route).order
  end

  private

  def route_station_by_route(route)
    RouteStation.find_by(route: route, railway_station_id: self)
  end
end
