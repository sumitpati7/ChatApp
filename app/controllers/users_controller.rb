class UsersController < ApplicationController
    def appendUserAttributes
        @user_to_update = current_user
    end


    def updateProfile
        @user = current_user
        @user.update(user_params)
        binding.pry
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :profile_picture)
    end
  end