class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|

      t.timestamps null: false
    end

    add_belongs_to :tickets, :user
    add_belongs_to :tickets, :train
    add_belongs_to :railway_stations, :start_station
    add_belongs_to :railway_stations, :end_station
  end
end
