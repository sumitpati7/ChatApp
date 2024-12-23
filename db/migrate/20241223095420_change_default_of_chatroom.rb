class ChangeDefaultOfChatroom < ActiveRecord::Migration[7.2]
  def change
    change_column_default :chatrooms, :is_group, false
  end
end
