class Publisher < ApplicationRecord
  belongs_to :field_service_group
  has_many :field_service_reports
end
