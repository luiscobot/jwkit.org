class ModifyPublishers < ActiveRecord::Migration[7.1]
  def change
    # Add new columns
    add_column :publishers, :first_name, :string
    add_column :publishers, :last_name, :string
    add_column :publishers, :date_of_birth, :date
    add_column :publishers, :gender, :string
    add_column :publishers, :date_of_baptism, :date
    add_column :publishers, :group, :string

    # Update existing data to populate new columns
    Publisher.find_each do |publisher|
      first_name, last_name = publisher.name.split
      publisher.update_columns(
        first_name: first_name,
        last_name: last_name
      )
    end

    # Modify existing columns
    change_column_null :publishers, :field_service_group_id, true

    # Remove existing columns
    remove_column :publishers, :name, :string
  end
end
