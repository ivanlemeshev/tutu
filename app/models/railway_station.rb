class RailwayStation < ActiveRecord::Base
  has_many :route_stations
  has_many :routes, through: :route_stations

  validates :title, presence: true

  scope :ordered, -> { joins(:route_stations).order('route_stations.position').uniq }

  def update_params(route, params)
    route_station = route_station(route)
    route_station.update(params) if route_station
    route.save
  end

  def position_in(route)
    route_station(route).try(:position)
  end

  def departure_time(route)
    route_station(route).try(:departure_time)
  end

  def arrival_time(route)
    route_station(route).try(:arrival_time)
  end

  protected

  def route_station(route)
    @station_route ||= route_stations.where(route: route).first
  end
end
