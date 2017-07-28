class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  #everything beyond this point will be private, and not available to call on
  #before filters

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin, organisation_attributes: :name)
    end

    #confirms a logged in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "please log in"
        redirect_to login_url
      end
    end

    #confirms a correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    #confirms a superadmin user
    def superadmin_user
      redirect_to(root_url) unless current_user.superadmin?
    end


end
