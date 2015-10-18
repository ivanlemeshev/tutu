class RailwayStation < ActiveRecord::Base
  has_many :route_stations
  has_many :routes, through: :route_stations

  validates :title, presence: true

  def update_position(route, order)
    route_station = RouteStation.find_by(route_id: route.id, railway_station_id: self.id)
    route_station.order = order
    route_station.save
  end

  def position(route)
    RouteStation.find_by(route_id: route.id, railway_station_id: self.id).order
  end
end
