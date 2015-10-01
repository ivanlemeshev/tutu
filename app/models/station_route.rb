class StationRoute < ActiveRecord::Base
  validates :station_id, :route_id, presence: true

  belongs_to :railway_station
  belongs_to :route
end
