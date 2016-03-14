require 'test_helper'

class CarModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_model = car_models(:one)
  end

  test "should get index" do
    get car_models_url
    assert_response :success
  end

  test "should create car_model" do
    assert_difference('CarModel.count') do
      post car_models_url, params: { car_model: { mark: @car_model.mark, model: @car_model.model } }
    end

    assert_response 201
  end

  test "should show car_model" do
    get car_model_url(@car_model)
    assert_response :success
  end

  test "should update car_model" do
    patch car_model_url(@car_model), params: { car_model: { mark: @car_model.mark, model: @car_model.model } }
    assert_response 200
  end

  test "should destroy car_model" do
    assert_difference('CarModel.count', -1) do
      delete car_model_url(@car_model)
    end

    assert_response 204
  end
end
