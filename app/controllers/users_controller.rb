class UsersController < ApplicationController
    before_action :authenticate_user!
    def appendUserAttributes
        @user_to_update = current_user
    end


    def updateProfile
        @user = current_user
        @user.update(user_params)
        redirect_to chatrooms_index_path
        # binding.pry
    end

    def show
        @user = User.find(params[:id])
        @users = User.all_except(current_user)
        @chatrooms = Chatroom.groups
        @room_name = get_name(@user, current_user)
        @chatroom = Chatroom.where(name: @room_name).first || Chatroom.create_private_room(@room_name, [@user, current_user])
        @messages = @chatroom.messages.order(created_at: :asc)

        render "chatrooms/show"
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :user_name, :profile_picture)
    end

    def get_name(user1, user2)
        users = [user1, user2].sort
        "private_#{users[0].id}_#{users[1].id}"
    end
  end