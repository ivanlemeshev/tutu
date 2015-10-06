class AddFullNameToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :first_name, :string
    add_column :tickets, :middle_name, :string
    add_column :tickets, :last_name, :string

    remove_belongs_to :railway_stations, :start_station
    remove_belongs_to :railway_stations, :end_station

    add_belongs_to :tickets, :start_station
    add_belongs_to :tickets, :end_station
  end
end
