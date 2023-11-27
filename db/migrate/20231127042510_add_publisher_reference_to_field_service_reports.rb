class AddPublisherReferenceToFieldServiceReports < ActiveRecord::Migration[7.0]
  def change
    add_reference :field_service_reports, :publisher, null: false, foreign_key: true
  end
end
