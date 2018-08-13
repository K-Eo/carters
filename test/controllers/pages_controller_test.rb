require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get landing page" do
    get root_url
    assert_response :success
  end
end
