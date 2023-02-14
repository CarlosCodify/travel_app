# frozen_string_literal: true

require 'test_helper'

class BusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus = buses(:one)
  end

  test 'should get index' do
    get buses_url, as: :json
    assert_response :success
  end

  test 'should create bus' do
    assert_difference('Bus.count') do
      post buses_url, params: { bus: {} }, as: :json
    end

    assert_response :created
  end

  test 'should show bus' do
    get bus_url(@bus), as: :json
    assert_response :success
  end

  test 'should update bus' do
    patch bus_url(@bus), params: { bus: {} }, as: :json
    assert_response :success
  end

  test 'should destroy bus' do
    assert_difference('Bus.count', -1) do
      delete bus_url(@bus), as: :json
    end

    assert_response :no_content
  end
end
