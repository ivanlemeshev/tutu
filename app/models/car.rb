class Car < ActiveRecord::Base
  validates :type, :up_place_count, :down_place_count, presence: true

  belongs_to :train
end
