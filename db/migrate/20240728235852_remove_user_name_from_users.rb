class RemoveUserNameFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :username
  end
end
