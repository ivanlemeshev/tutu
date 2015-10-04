class Car < ActiveRecord::Base
  KINDS = { passenger: 1, cargo: 2 }

  validates :kind, :up_place_count, :down_place_count, presence: true
  validates :up_place_count, :down_place_count, numericality: { only_integer: true }

  belongs_to :train

  def kind_name
    KINDS.key(kind)
  end
end
