class Publisher < ApplicationRecord
  belongs_to :field_service_group
  has_many :field_service_reports, dependent: :destroy

  def name
    "#{ first_name } #{ last_name }"
  end

  def has_field_service_report_from_last_month?
    field_service_reports.from_last_month.present?
  end
end
