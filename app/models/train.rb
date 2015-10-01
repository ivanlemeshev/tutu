class Train < ActiveRecord::Base
  validates :number, presence: true
end
