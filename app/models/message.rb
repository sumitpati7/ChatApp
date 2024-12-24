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

  before_create :confirm_participant


  after_create_commit { broadcast_append_to self.chatroom }


  def confirm_participant
    if !chatroom.is_group
      is_participant = ChatUser.where(user_id: user.id, chatroom_id: chatroom.id).first
    end
  end
end
