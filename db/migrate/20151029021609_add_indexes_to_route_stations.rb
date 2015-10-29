class AddIndexesToRouteStations < ActiveRecord::Migration
  def change
    add_index :route_stations, :railway_station_id
    add_index :route_stations, :route_id
    add_index :route_stations, [:route_id, :position]
  end
end
