class Train < ActiveRecord::Base
  belongs_to :route

  has_many :tickets
  has_many :cars

  validates :number, presence: true, uniqueness: true

  def compartment_cars
    cars.compartment
  end

  def economy_cars
    cars.economy
  end

  def compartment_place_count(type)
    compartment_cars.sum("#{type}_place_count")
  end

  def economy_place_count(type)
    economy_cars.sum("#{type}_place_count")
  end
end
