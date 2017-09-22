require 'test_helper'

class PlayerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get player_create_url
    assert_response :success
  end

  test "should get update" do
    get player_update_url
    assert_response :success
  end

  test "should get edit" do
    get player_edit_url
    assert_response :success
  end

  test "should get delete" do
    get player_delete_url
    assert_response :success
  end

end
