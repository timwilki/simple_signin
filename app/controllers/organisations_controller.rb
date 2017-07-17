class OrganisationsController < ApplicationController
  before_action :logged_in_user,      only: [:index, :show, :new]
  #before_action :correct_user,        only: [:show, :edit, :update, :destroy]
  before_action :superadmin_user,     only: [:index, :show, :edit, :update, :destroy]

  def index
    @organisations = Organisation.all
  end

  def show
    #add code here to limit show view to only the users organisation
    @organisation = Organisation.find(params[:id])
    @teammembers = @organisation.team_members
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(org_params)
  end

  def destroy
    Organisation.find(params[:id]).destroy
    flash[:success] = "Organisation deleted"
    redirect_to organisations_url
  end

  #everything beyond this point will be private, and not available to call on
  private

    #before filters

    def org_params
      params.require(:organisation).permit(:name)
    end



end
