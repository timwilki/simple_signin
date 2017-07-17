class TeamMembersController < ApplicationController
  before_action :logged_in_user,      only: [:index, :show, :new, :update, :destroy]
  #before_action :correct_user,        only: [:update, :destroy]
  #before_action :superadmin_user,     only: [:index, :show, :edit, :update, :destroy]


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

  def destroy
    @teammember = TeamMember.find(params[:id]).destroy
    flash[:success] = "Team Member deleted"
    redirect_to root_url
  end

  private

  def teammember_params
    params.require(:team_member).permit(:first_name, :last_name)
  end

end
