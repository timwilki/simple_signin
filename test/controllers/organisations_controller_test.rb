require 'test_helper'

class OrganisationsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @organisation = organisations(:TestOrg)
    @other_organisation = organisations(:OtherOrg)
  end

  test "should redirect destroy when logged in as a non-superadmin" do
    log_in_as(@other_user)
    assert_no_difference 'Organisation.count' do
      delete organisation_path(@organisation)
    end
    assert_redirected_to root_url
  end

end
