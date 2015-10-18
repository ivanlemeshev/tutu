class AddSeatsToCar < ActiveRecord::Migration
  def change
    rename_column :cars, :up_place_count, :top_seats
    rename_column :cars, :down_place_count, :bottom_seats
    add_column :cars, :side_top_seats, :integer
    add_column :cars, :side_bottom_seats, :integer
    add_column :cars, :type, :string
    remove_column :cars, :kind
  end
end
