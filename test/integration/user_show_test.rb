require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest

  def setup
    @inactive_user = users(:inactive)
    @activated_user = users(:archer)
    @alternative_user = users(:michael)
    @another_user = users(:lana)
  end

  test "should redirect to root_url when user not activated" do
    get user_path(@inactive_user)
    assert_redirected_to root_url
  end

  test "should redirect to users_path when not from same org as user requested" do
    log_in_as(@activated_user)
    get user_path(@another_user)
    assert_redirected_to users_path
  end

  test "should display user when activated and belongs to the same org as admin" do
    log_in_as(@activated_user)
    get user_path(@alternative_user)
    assert_response :success
  end

end
