class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_incomplete_profile
  def index
    @users = User.all_except(current_user)
    @chatrooms = Chatroom.groups
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages.order(created_at: :asc)
    @users = User.all_except(current_user)
    @chatrooms = Chatroom.groups
  end
end
