class AddOnlineStatusToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :online_status, :boolean, default: false, null: false
  end
end
