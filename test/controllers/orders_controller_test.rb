require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { comment: @order.comment, cost: @order.cost, from_location_id: @order.from_location_id, order_state_id: @order.order_state_id, score: @order.score, to_location_id: @order.to_location_id, user_id: @order.user_id } }
    end

    assert_response 201
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { comment: @order.comment, cost: @order.cost, from_location_id: @order.from_location_id, order_state_id: @order.order_state_id, score: @order.score, to_location_id: @order.to_location_id, user_id: @order.user_id } }
    assert_response 200
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_response 204
  end
end
