class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :confirmable, :validatable

  validates :first_name, :last_name, presence: true
  validates :email, email: true

  has_many :tickets

  def full_name
    "#{first_name} #{last_name}"
  end

  def owner_of?(ticket)
    ticket.user_id == id
  end
end
