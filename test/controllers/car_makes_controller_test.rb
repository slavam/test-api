require 'test_helper'

class CarMakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_make = car_makes(:one)
  end

  test "should get index" do
    get car_makes_url
    assert_response :success
  end

  test "should create car_make" do
    assert_difference('CarMake.count') do
      post car_makes_url, params: { car_make: { mark: @car_make.mark } }
    end

    assert_response 201
  end

  test "should show car_make" do
    get car_make_url(@car_make)
    assert_response :success
  end

  test "should update car_make" do
    patch car_make_url(@car_make), params: { car_make: { mark: @car_make.mark } }
    assert_response 200
  end

  test "should destroy car_make" do
    assert_difference('CarMake.count', -1) do
      delete car_make_url(@car_make)
    end

    assert_response 204
  end
end
