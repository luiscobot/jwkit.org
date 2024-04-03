class AddServicePrivilegeReferenceToPublishers < ActiveRecord::Migration[7.1]
  def change
    add_reference :publishers, :service_privilege, null: true, foreign_key: true
  end
end
