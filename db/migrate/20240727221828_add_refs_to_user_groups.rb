class AddRefsToUserGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_groups, :user, foreign_key: true
    add_reference :user_groups, :group, foreign_key: true
  end
end
