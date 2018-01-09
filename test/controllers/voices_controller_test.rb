require 'test_helper'

class VoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get voices_index_url
    assert_response :success
  end

end
