require "test_helper"

class Users::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_reservations_new_url
    assert_response :success
  end

  test "should get create" do
    get users_reservations_create_url
    assert_response :success
  end

  test "should get index" do
    get users_reservations_index_url
    assert_response :success
  end

  test "should get show" do
    get users_reservations_show_url
    assert_response :success
  end

  test "should get confirm" do
    get users_reservations_confirm_url
    assert_response :success
  end
end
