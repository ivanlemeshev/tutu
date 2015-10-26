class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train

  validates :first_name, :last_name, :middle_name, presence: true
  validates :passport_series, :passport_number, :train_id, presence: true

  def start_station
    train.route.start_station if has_route?
  end

  def end_station
    train.route.end_station if has_route?
  end

  protected

  def has_route?
    train.present? && train.route.present?
  end
end
