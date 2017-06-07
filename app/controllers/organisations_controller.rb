class OrganisationsController < ApplicationController

  def show
    @organisation = Organisation.find(params[:id])
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(org_params)
  end

  #everything beyond this point will be private, and not available to call on
  private

    #before filters

    def org_params
      params.require(:organisation).permit(:name)
    end


end
