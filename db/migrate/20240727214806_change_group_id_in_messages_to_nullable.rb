class ChangeGroupIdInMessagesToNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :messages, :group_id, true
  end
end
