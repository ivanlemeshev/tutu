class Car < ActiveRecord::Base
  default_scope { order(:serial_number) }

  TYPES = {
    I18n.t('cars.economy') => 'EconomyCar',
    I18n.t('cars.coupe')   => 'CoupeCar',
    I18n.t('cars.premium') => 'PremiumCar',
    I18n.t('cars.sitting') => 'SittingCar'
  }

  belongs_to :train

  validates :type, :serial_number, :bottom_seats, presence: true
  validates :serial_number, :bottom_seats, numericality: { only_integer: true }
  validates :serial_number, uniqueness: { scope: :train_id }

  scope :coupe, -> { where(type: 'CoupeCar') }
  scope :economy, -> { where(type: 'EconomyCar') }
  scope :premium, -> { where(type: 'PremiumCar') }
  scope :sitting, -> { where(type: 'SittingCar') }

  before_validation :set_serial_number

  def type_name
    self.type.gsub('Car', '').downcase
  end

  private

  def set_serial_number
    self.serial_number ||= next_serial_number
  end

  def next_serial_number
    cars = Car.where(train: train).all
    return 1 if cars.empty?
    cars.last.serial_number + 1
  end
end
