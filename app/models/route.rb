class Route < ActiveRecord::Base
  validates :title, presence: true

  has_many :route_stations
  has_many :railway_stations, through: :route_stations
  has_many :trains
end
