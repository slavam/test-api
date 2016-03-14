require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { city: @user.city, code_token: @user.code_token, date_of_birth: @user.date_of_birth, first_name: @user.first_name, have_car: @user.have_car, last_name: @user.last_name, phone: @user.phone, picture: @user.picture, user_state_id: @user.user_state_id } }
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { city: @user.city, code_token: @user.code_token, date_of_birth: @user.date_of_birth, first_name: @user.first_name, have_car: @user.have_car, last_name: @user.last_name, phone: @user.phone, picture: @user.picture, user_state_id: @user.user_state_id } }
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_response 204
  end
end
