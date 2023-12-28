class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      
      t.index 'LOWER(email)', unique: true, name: 'index_users_on_lowercase_email'

      t.timestamps
    end
  end
end
