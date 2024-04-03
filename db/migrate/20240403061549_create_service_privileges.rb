class CreateServicePrivileges < ActiveRecord::Migration[7.1]
  def change
    create_table :service_privileges do |t|
      t.string :name

      t.timestamps
    end
  end
end
