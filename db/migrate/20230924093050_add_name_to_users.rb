class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, :name, unique: true
  end
end
