class User < ActiveRecord::Base
  has_many :tickets

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true
end
