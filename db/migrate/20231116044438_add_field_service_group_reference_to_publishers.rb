class AddFieldServiceGroupReferenceToPublishers < ActiveRecord::Migration[7.0]
  def change
    add_reference :publishers, :field_service_group, null: false, foreign_key: true
  end
end
