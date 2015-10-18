class RouteStation < ActiveRecord::Base
  default_scope { order(:order) }

  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
end
