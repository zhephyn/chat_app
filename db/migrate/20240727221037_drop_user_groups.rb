class DropUserGroups < ActiveRecord::Migration[7.1]
  def change
    drop_table :user_groups
  end
end
