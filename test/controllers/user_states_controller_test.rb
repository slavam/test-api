require 'test_helper'

class UserStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_state = user_states(:one)
  end

  test "should get index" do
    get user_states_url
    assert_response :success
  end

  test "should create user_state" do
    assert_difference('UserState.count') do
      post user_states_url, params: { user_state: { name: @user_state.name } }
    end

    assert_response 201
  end

  test "should show user_state" do
    get user_state_url(@user_state)
    assert_response :success
  end

  test "should update user_state" do
    patch user_state_url(@user_state), params: { user_state: { name: @user_state.name } }
    assert_response 200
  end

  test "should destroy user_state" do
    assert_difference('UserState.count', -1) do
      delete user_state_url(@user_state)
    end

    assert_response 204
  end
end
