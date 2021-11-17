require "test_helper"

class CaloriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calories_index_url
    assert_response :success
  end
end
