class AddAuxiliaryPioneerToFieldServiceReport < ActiveRecord::Migration[7.1]
  def change
    add_column :field_service_reports, :auxiliary_pioneer, :boolean, default: false
  end
end
