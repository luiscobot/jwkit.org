class FieldServiceReport < ApplicationRecord
  belongs_to :publisher

  validates :month, uniqueness: { scope: [:publisher_id, :year] }
end
