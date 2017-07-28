class SigninSheetsController < ApplicationController
  before_action :logged_in_user

  def show
    @signin_sheet = TeamMember.signin_sheet.last
  end

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
    if @signout.save
      redirect_to :back
      flash[:success] = "Take a load off!"
    end
  end

#  def update
#    @signin = SigninSheet.find_by(team_member_id: "1")
#    if @signin.save
#      flash[:success] = "put your feet up, you've earned it!"
#    end
#  end

  private

  def signin_params
    params.permit(:team_member_id)
  end


end
