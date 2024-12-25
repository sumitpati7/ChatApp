# == Schema Information
#
# Table name: chatrooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  is_group   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chatroom < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :chat_users, dependent: :destroy
    has_many :users, through: :chat_user
    has_one_attached :group_photo

    scope :groups, -> { where(is_group: true)}

    after_create_commit { broadcast_if_group }

    def broadcast_if_group
        broadcast_append_to "chatrooms"
    end

    def self.create_private_room(room_name, users)
        single_room = Chatroom.create(name: room_name, is_group: false)
        users.each do |user|
            ChatUser.create(user_id: user.id, chatroom_id: single_room.id)
        end
        single_room
    end
end
