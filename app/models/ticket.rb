class Ticket < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :train_id, :start_station_id, :end_station_id, presence: true

  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: 'start_station_id'
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: 'end_station_id'
end
