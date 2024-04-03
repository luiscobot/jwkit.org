class RemovePrivilegeOfServiceFromPublisher < ActiveRecord::Migration[7.1]
  def change
    remove_column :publishers, :privilege_of_service, :string
  end
end
