class Route < ActiveRecord::Base
  validates :title, presence: true

  has_many :station_routes
  has_many :railway_stations, through: :station_routes
end
