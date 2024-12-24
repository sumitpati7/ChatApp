class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # before_action :redirect_incomplete_profile


  private
  def redirect_incomplete_profile
    if current_user && !current_user.profile_completed?
      redirect_to appendUserAttributes_users_path
    end
  end
end
