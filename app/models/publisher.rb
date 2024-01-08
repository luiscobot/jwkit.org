class Publisher < ApplicationRecord
  belongs_to :field_service_group
  has_many :field_service_reports, dependent: :destroy

  scope :missing_last_month_reports, -> {
    where.not(id: FieldServiceReport.where(year: Date.current.last_month.year, month: Date.current.last_month.month).select(:publisher_id))
  }

  scope :with_reports_from_date, -> (month, year) {
    includes(:field_service_reports)
      .where(field_service_reports: { year: year, month: month })
      .map(&:field_service_reports)
      .flatten
  }
end
