class RailwayStation < ActiveRecord::Base
  validates :title, presence: true
end
