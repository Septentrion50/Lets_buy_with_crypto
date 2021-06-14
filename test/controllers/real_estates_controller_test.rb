require 'test_helper'

class RealEstatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get real_estates_index_url
    assert_response :success
  end

  test "should get show" do
    get real_estates_show_url
    assert_response :success
  end

  test "should get new" do
    get real_estates_new_url
    assert_response :success
  end

  test "should get create" do
    get real_estates_create_url
    assert_response :success
  end

  test "should get edit" do
    get real_estates_edit_url
    assert_response :success
  end

  test "should get update" do
    get real_estates_update_url
    assert_response :success
  end

  test "should get destroy" do
    get real_estates_destroy_url
    assert_response :success
  end

end