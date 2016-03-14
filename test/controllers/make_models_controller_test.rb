require 'test_helper'

class MakeModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @make_model = make_models(:one)
  end

  test "should get index" do
    get make_models_url
    assert_response :success
  end

  test "should create make_model" do
    assert_difference('MakeModel.count') do
      post make_models_url, params: { make_model: { car_make_id: @make_model.car_make_id, model: @make_model.model } }
    end

    assert_response 201
  end

  test "should show make_model" do
    get make_model_url(@make_model)
    assert_response :success
  end

  test "should update make_model" do
    patch make_model_url(@make_model), params: { make_model: { car_make_id: @make_model.car_make_id, model: @make_model.model } }
    assert_response 200
  end

  test "should destroy make_model" do
    assert_difference('MakeModel.count', -1) do
      delete make_model_url(@make_model)
    end

    assert_response 204
  end
end
