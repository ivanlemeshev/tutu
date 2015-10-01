class StationRoute < ActiveRecord::Base
  validates :station_id, presence: true
  validates :route_id, presence: true

  belongs_to :railway_station
  belongs_to :route
end
