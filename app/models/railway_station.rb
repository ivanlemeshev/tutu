class RailwayStation < ActiveRecord::Base
  validates :title, presence: true

  has_many :station_routes
  has_many :routes, through: :station_routes
end
