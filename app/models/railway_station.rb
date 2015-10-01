class RailwayStation < ActiveRecord::Base
  validates :title, presence: true

  has_many :route_stations
  has_many :routes, through: :route_stations
end
