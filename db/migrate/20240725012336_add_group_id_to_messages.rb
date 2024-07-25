class AddGroupIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :group, null: false, foreign_key: true
  end
end
