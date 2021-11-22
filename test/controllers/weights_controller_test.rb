require "test_helper"

class WeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weights_index_url
    assert_response :success
  end

  test "should get show" do
    get weights_show_url
    assert_response :success
  end

  test "should get edit" do
    get weights_edit_url
    assert_response :success
  end

  test "should get new" do
    get weights_new_url
    assert_response :success
  end
end
