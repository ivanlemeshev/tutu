class Train < ActiveRecord::Base
  validates :number, presence: true

  belongs_to :route
end
