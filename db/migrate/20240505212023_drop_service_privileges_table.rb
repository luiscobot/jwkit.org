class DropServicePrivilegesTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :service_privileges
  end
end
