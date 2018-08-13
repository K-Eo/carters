require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get wellcome" do
    get pages_wellcome_url
    assert_response :success
  end

end
