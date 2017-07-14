class TeamMembersController < ApplicationController

  def index
    @team_members = TeamMember.paginate(page: params[:page])
  end

  def show
    @team_member = TeamMember.find(params[:id])
  end

  def new
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


  private

  def teammember_params
    params.require(:team_member).permit(:first_name, :last_name)
  end


end
