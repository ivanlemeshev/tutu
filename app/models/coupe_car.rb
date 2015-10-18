class CoupeCar < Car
  validates :top_seats, presence: true
  validates :top_seats, numericality: { only_integer: true }

  def self.model_name
    Car.model_name
  end
end
