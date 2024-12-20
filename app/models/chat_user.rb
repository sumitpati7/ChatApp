# == Schema Information
#
# Table name: chat_users
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  chatroom_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ChatUser < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
end
