require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase

  def setup
    @organisation = Organisation.new(name: "Google")
  end

  test "should be valid" do
    assert @organisation.valid?
  end

end
