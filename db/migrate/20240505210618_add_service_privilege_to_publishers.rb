class AddServicePrivilegeToPublishers < ActiveRecord::Migration[7.1]
  def change
    remove_column :publishers, :service_privilege_id

    add_column :publishers, :service_privilege, :string
  end
end
