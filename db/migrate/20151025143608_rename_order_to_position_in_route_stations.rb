class RenameOrderToPositionInRouteStations < ActiveRecord::Migration
  def change
    rename_column :route_stations, :order, :position
  end
end
