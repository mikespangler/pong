require 'test_helper'

class ScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get score_create_url
    assert_response :success
  end

  test "should get update" do
    get score_update_url
    assert_response :success
  end

  test "should get edit" do
    get score_edit_url
    assert_response :success
  end

  test "should get delete" do
    get score_delete_url
    assert_response :success
  end

end
