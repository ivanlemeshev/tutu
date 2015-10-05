class Train < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true

  belongs_to :route

  has_many :tickets
  has_many :cars

  has_many :compartment_cars, -> { compartment }, class_name: 'Car', foreign_key: 'train_id'
  has_many :economy_cars, -> { economy }, class_name: 'Car', foreign_key: 'train_id'

  def compartment_place_count(type)
    compartment_cars.sum("#{type}_place_count")
  end

  def economy_place_count(type)
    economy_cars.sum("#{type}_place_count")
  end
end
