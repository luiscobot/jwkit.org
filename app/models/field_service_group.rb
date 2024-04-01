class FieldServiceGroup < ApplicationRecord
  has_many :publishers
  has_many :field_service_reports, through: :publishers

  def to_param
    number
  end
end
