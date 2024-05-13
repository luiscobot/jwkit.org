class Publisher < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :date_of_birth_cannot_be_in_the_future
  validates :gender, presence: true, inclusion: { in: ["male", "female"] }
  validate :date_of_baptism_cannot_be_in_the_future
  validates :group, presence: true, inclusion: { in: ["other_sheep", "anointed"] }
  validates :service_privilege, inclusion: { in: ["auxiliary_pioneer", "regular_pioneer", "special_pioneer", "field_missionary"] }, allow_blank: true

  belongs_to :field_service_group, optional: true
  has_many :field_service_reports, dependent: :destroy

  def name
    "#{ first_name } #{ last_name }"
  end

  def has_field_service_report_from_last_month?
    field_service_reports.from_last_month.present?
  end

  private

  def date_of_birth_cannot_be_in_the_future
    if date_of_birth.present? && date_of_birth.future?
      errors.add(:date_of_birth, "cannot be in the future")
    end
  end

  def date_of_baptism_cannot_be_in_the_future
    if date_of_baptism.present? && date_of_baptism.future?
      errors.add(:date_of_baptism, "cannot be in the future")
    end
  end
end
