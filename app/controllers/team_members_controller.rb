class TeamMembersController < ApplicationController
  before_action :logged_in_user,      only: [:index, :show, :new, :update, :destroy, :edit]
  #before_action :correct_user,        only: [:update, :destroy]
  #before_action :superadmin_user,     only: [:index, :show, :edit, :update, :destroy]


  def index
    @team_members = current_user.organisation.team_members.paginate(page: params[:page]).order(:first_name)
  end

  def show
    @team_member = TeamMember.find(params[:id])
    #@signin_sheets = @team_member.signin_sheets.paginate(page: params[:page])
    @signin_sheets = @team_member.signin_sheets.group_by { |t| t.created_at.beginning_of_month}
  end

  def new
    @signin = SigninSheet.new
  end

  def create
    @teammember = current_user.organisation.team_members.build(teammember_params)
    if @teammember.save
      flash[:success] = "Team Member Created!"
    redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def edit
    @teammember = TeamMember.find(params[:id])
  end


  def update
    @teammember = TeamMember.find(params[:id])
    if @teammember.update_attributes(teammember_params)
      redirect_to @teammember
    else
      render 'edit'
    end
  end

  def import
    begin
      @team_member = current_user.organisation.team_members
      @team_member.import(params[:file])
      redirect_to root_url, notice: "Team Members imported."
    rescue
      redirect_to root_url, notice: "Oh snap! did you follow the right format?"
    end
  end

  def destroy
    @teammember = TeamMember.find(params[:id]).destroy
    flash[:success] = "Team Member deleted"
    redirect_to root_url
  end



  private

  def teammember_params
    params.require(:team_member).permit(:first_name, :last_name, :email)
  end

end
