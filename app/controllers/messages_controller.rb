class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    message = Message.create!(message_params)
    redirect_to chatroom_path(message.chatroom_id)
  end

  private
  def message_params
    params.require(:message).permit(:content, :user_id, :chatroom_id)
  end
end
