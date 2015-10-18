class Train < ActiveRecord::Base
  belongs_to :route

  has_many :tickets
  has_many :cars

  validates :number, presence: true, uniqueness: true

  def cars_by_type(type)
    cars.send(type)
  end

  def car_seats(car_type, seat_type)
    cars_by_type(car_type).sum("#{seat_type}_seats")
  end
end
