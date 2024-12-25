class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    message = Message.create!(message_params)
    if message.chatroom.is_group
      redirect_to chatroom_path(message.chatroom_id)
    else
      other_user = message.chatroom.chat_users.reject {|user| user.user[:id]==message.user_id}.first
      redirect_to user_path(other_user.user_id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :user_id, :chatroom_id)
  end
end
