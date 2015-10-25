class RailwayStation < ActiveRecord::Base
  has_many :route_stations
  has_many :routes, through: :route_stations

  validates :title, presence: true

  scope :ordered, -> { joins(:route_stations).order('route_stations.position').uniq }

  def update_position(route, position)
    route_station = route_station(route)
    route_station.update(position: position) if route_station
    route.save
  end

  def position_in(route)
    route_station(route).try(:position)
  end

  private

  def route_station(route)
    @station_route ||= route_stations.where(route: route).first
  end
end
