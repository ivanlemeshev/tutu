class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :confirmable, :validatable

  has_many :tickets
end
