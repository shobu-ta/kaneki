require "test_helper"

class Users::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_reviews_new_url
    assert_response :success
  end

  test "should get index" do
    get users_reviews_index_url
    assert_response :success
  end

  test "should get show" do
    get users_reviews_show_url
    assert_response :success
  end

  test "should get create" do
    get users_reviews_create_url
    assert_response :success
  end

  test "should get edit" do
    get users_reviews_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_reviews_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_reviews_destroy_url
    assert_response :success
  end
end
