class FieldServiceReport < ApplicationRecord
  belongs_to :publisher

  validates :month, uniqueness: { scope: [:publisher_id, :year] }

  scope :from_last_month, -> { where(year: Date.current.last_month.year, month: Date.current.last_month.month) }
  scope :from_service_year, ->(year = Date.current.year) { where(year: year) }
end
