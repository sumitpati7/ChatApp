# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  chatroom_id :bigint           not null
#  user_id     :bigint           not null
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  after_create_commit { broadcast_append_to self.chatroom }
end
