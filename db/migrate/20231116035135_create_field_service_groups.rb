class CreateFieldServiceGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :field_service_groups do |t|
      t.integer :number

      t.timestamps
    end
  end
end
