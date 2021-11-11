require "test_helper"

class CheckServiceControllerTest < ActionDispatch::IntegrationTest

  test "should check service response" do
    get check_service_url, as: :json
    assert_response :success
  end
end
