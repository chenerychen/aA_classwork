class ChangeUsersTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username

    add_column :users, :username, :string, null: false 
    add_index :users, :username, unique: true      ## Organize rails for a fast/quick search for the object  # username is unique
  end
end
