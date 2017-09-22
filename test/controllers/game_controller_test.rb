require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get game_create_url
    assert_response :success
  end

  test "should get update" do
    get game_update_url
    assert_response :success
  end

  test "should get edit" do
    get game_edit_url
    assert_response :success
  end

  test "should get delete" do
    get game_delete_url
    assert_response :success
  end

end
