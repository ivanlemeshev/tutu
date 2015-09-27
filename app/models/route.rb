class Route < ActiveRecord::Base
  validates :title, presence: true
end
