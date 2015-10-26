class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :confirmable, :validatable

  validates :first_name, :last_name, presence: true

  has_many :tickets

  def full_name
    "#{first_name} #{last_name}"
  end
end
