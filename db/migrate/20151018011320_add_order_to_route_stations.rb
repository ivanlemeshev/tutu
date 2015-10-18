class AddOrderToRouteStations < ActiveRecord::Migration
  def change
    add_column :route_stations, :order, :integer
  end
end
