class EconomyCar < Car
  validates :top_seats, :side_top_seats, :side_bottom_seats, presence: true
  validates :top_seats, :side_top_seats, :side_bottom_seats, numericality: { only_integer: true }

  def self.model_name
    Car.model_name
  end
end
