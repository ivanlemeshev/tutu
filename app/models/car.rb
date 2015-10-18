class Car < ActiveRecord::Base
  TYPES = { economy: 'EconomyCar', coupe: 'CoupeCar', premium: 'PremiumCar', sitting: 'SittingCar' }

  belongs_to :train

  validates :type, :bottom_seats, presence: true
  validates :bottom_seats, numericality: { only_integer: true }

  scope :coupe, -> { where(type: 'CoupeCar') }
  scope :economy, -> { where(type: 'EconomyCar') }
  scope :premium, -> { where(type: 'PremiumCar') }
  scope :sitting, -> { where(type: 'SittingCar') }

  def type_name
    self.type.gsub('Car', '').downcase
  end
end
