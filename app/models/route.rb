class Route < ActiveRecord::Base
  has_many :route_stations
  has_many :railway_stations, through: :route_stations
  has_many :trains

  validates :title, presence: true
  validate :stations_count

  before_validation :set_title

  def self.search(params)
    self.find_by_sql([self.search_query, params[:start_station_id], params[:end_station_id]])
  end

  def start_station
    railway_stations.first
  end

  def end_station
    railway_stations.last
  end

  private

  def self.search_query
    <<-SQL
      SELECT * FROM routes WHERE
        (SELECT railway_station_id
         FROM route_stations
         WHERE route_id = routes.id AND
               position = (SELECT MIN(position)
                           FROM route_stations
                           WHERE route_id = routes.id)) = ? AND
        (SELECT railway_station_id
         FROM route_stations
         WHERE route_id = routes.id AND
               position = (SELECT MAX(position)
                           FROM route_stations
                           WHERE route_id = routes.id)) = ?
    SQL
  end

  def set_title
    self.title = "#{start_station.title} - #{end_station.title}" if railway_stations?
  end

  def stations_count
    errors.add(:base, 'Route should contain at least 2 stations') unless railway_stations?
  end

  def railway_stations?
    railway_stations.size >= 2
  end
end
