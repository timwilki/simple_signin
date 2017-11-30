class SigninSheetsController < ApplicationController
  before_action :logged_in_user

  def create
    @signin = SigninSheet.new(signin_params)
    @signin.save
    if @signin.save
      redirect_to :back
      flash[:success] = "Make this one count yo!"
    end
  end

  def update
    @signout = SigninSheet.find(params[:id])
    @signout.toggle!(:signedin)
    @signout.update_attribute(:shift_length, @signout.updated_at - @signout.created_at)
    if @signout.save
      redirect_to :back
      flash[:success] = "Take a load off!"
    end
  end

  private

  def signin_params
    params.permit(:team_member_id)
  end


end
