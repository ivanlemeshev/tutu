class Car < ActiveRecord::Base
  KIND_COMPARTMENT = 1
  KIND_ECONOMY = 2

  KINDS = { compartment: KIND_COMPARTMENT, economy: KIND_ECONOMY }

  belongs_to :train

  validates :kind, :up_place_count, :down_place_count, presence: true
  validates :up_place_count, :down_place_count, numericality: { only_integer: true }

  scope :compartment, -> { where(kind: Car::KIND_COMPARTMENT) }
  scope :economy, -> { where(kind: Car::KIND_ECONOMY) }

  def kind_name
    KINDS.key(kind)
  end
end
