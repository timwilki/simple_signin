class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
before_action :correct_user,   only: [:edit, :update]
before_action :superadmin_user, only: [:destroy]

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
    @org_users = current_user.organisation.users.where(activated: true)
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    redirect_to users_path and return unless @user.organisation == current_user.organisation
    #logic should be show a user only if organisation_id matches current_user
  end

  def new
    @user = User.new
    @user.build_organisation
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    flash[:success] = "Profile updated"
    redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end



  private
  #everything beyond this point will be private, and not available to call on
  #before filters

end
