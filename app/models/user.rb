class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :confirmable, :validatable

  has_many :tickets

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true
end
