class Train < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true

  belongs_to :route
  has_many :tickets
end
