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
        
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :profile_picture)
    end
  end