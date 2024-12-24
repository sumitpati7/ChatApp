class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all_except(current_user)
    @chatrooms = Chatroom.groups
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages
  end
end
