require 'test_helper'

class MypetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mypets_new_url
    assert_response :success
  end

  test "should get create" do
    get mypets_create_url
    assert_response :success
  end

  test "should get edit" do
    get mypets_edit_url
    assert_response :success
  end

  test "should get update" do
    get mypets_update_url
    assert_response :success
  end

  test "should get destroy" do
    get mypets_destroy_url
    assert_response :success
  end

end
