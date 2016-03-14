require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { location: { address1: @location.address1, city: @location.city, country: @location.country, full_address: @location.full_address, lat: @location.lat, lng: @location.lng } }
    end

    assert_response 201
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { address1: @location.address1, city: @location.city, country: @location.country, full_address: @location.full_address, lat: @location.lat, lng: @location.lng } }
    assert_response 200
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_response 204
  end
end
