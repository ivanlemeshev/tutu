class Route < ActiveRecord::Base
  has_many :route_stations
  has_many :railway_stations, through: :route_stations
  has_many :trains

  validates :title, presence: true
  validate :stations_count

  before_validation :set_title

  private

  def set_title
    stations = railway_stations.ordered
    self.title = "#{stations.first.title} - #{stations.last.title}" if railway_stations?
  end

  def stations_count
    errors.add(:base, 'Route should contain at least 2 stations') unless railway_stations?
  end

  def railway_stations?
    railway_stations.size >= 2
  end
end
