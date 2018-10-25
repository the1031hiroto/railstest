require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get showchat" do
    get rooms_showchat_url
    assert_response :success
  end

end
