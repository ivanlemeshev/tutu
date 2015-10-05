class Train < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true

  belongs_to :route

  has_many :tickets
  has_many :cars

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
