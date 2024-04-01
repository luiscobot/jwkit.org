class FieldServiceGroup < ApplicationRecord
  has_many :publishers
  has_many :field_service_reports, through: :publishers
end
