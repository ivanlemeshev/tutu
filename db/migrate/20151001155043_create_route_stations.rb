class CreateRouteStations < ActiveRecord::Migration
  def change
    create_table :route_stations do |t|
      t.integer :railway_station_id
      t.integer :route_id
    end
  end
end
