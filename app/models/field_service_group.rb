class FieldServiceGroup < ApplicationRecord
  validates :number, presence: true, numericality: { only_integer: true }, uniqueness: true

  has_many :publishers
  has_many :field_service_reports, through: :publishers

  def to_param
    number
  end
end
