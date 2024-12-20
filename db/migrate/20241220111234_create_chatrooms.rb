class CreateChatrooms < ActiveRecord::Migration[7.2]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.boolean :is_group

      t.timestamps
    end
  end
end
