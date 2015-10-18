class AddCarsOrderToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :cars_order, :boolean
  end
end
