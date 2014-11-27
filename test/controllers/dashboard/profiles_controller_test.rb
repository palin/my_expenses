require 'test_helper'

class Dashboard::ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
