class CreateStationsRoutes < ActiveRecord::Migration
  def change
    create_table :stations_routes do |t|
      t.integer :station_id
      t.integer :route_id
    end
  end
end
