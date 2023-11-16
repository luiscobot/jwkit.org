class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :privilege_of_service

      t.timestamps
    end
  end
end
