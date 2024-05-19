class FieldServiceGroup < ApplicationRecord
  validates :number, presence: { message: "Ingresa un número." }, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "Debe ser un número positivo." }, uniqueness: { message: "Ya existe un grupo con ese número." }

  has_many :publishers
  has_many :field_service_reports, through: :publishers

  def to_param
    number
  end
end
