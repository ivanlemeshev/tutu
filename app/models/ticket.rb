class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train

  validates :first_name, :last_name, :middle_name, presence: true
  validates :passport_series, :passport_number, :train_id, presence: true

  after_create :send_buy_notification
  after_destroy :send_cancel_notification

  def route_name
    train.route.title
  end

  def start_station
    train.route.start_station
  end

  def end_station
    train.route.end_station
  end

  private

  def send_buy_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_cancel_notification
    TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end
end
