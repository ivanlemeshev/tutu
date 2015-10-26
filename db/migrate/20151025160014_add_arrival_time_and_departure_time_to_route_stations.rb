class AddArrivalTimeAndDepartureTimeToRouteStations < ActiveRecord::Migration
  def change
    add_column :route_stations, :departure_time, :datetime
    add_column :route_stations, :arrival_time, :datetime
  end
end
