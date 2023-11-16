class CreateFieldServiceReports < ActiveRecord::Migration[7.0]
  def change
    create_table :field_service_reports do |t|
      t.integer :month
      t.integer :year
      t.boolean :shared_in_ministry
      t.integer :bible_studies
      t.integer :hours
      t.text :comments

      t.timestamps
    end
  end
end
