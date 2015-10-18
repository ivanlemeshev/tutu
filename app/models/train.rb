class Train < ActiveRecord::Base
  belongs_to :route

  has_many :tickets
  has_many :cars

  validates :number, presence: true, uniqueness: true

  def ordered_cars
    return cars.reverse if cars_order
    cars
  end

  def car_seats(car_type, seat_type)
    Car.where(type: Car::TYPES[car_type], train_id: self.id).sum("#{seat_type}_seats")
  end
end
