# frozen_string_literal: true

require 'test_helper'

class VehicleModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_model = vehicle_models(:one)
  end

  test 'should get index' do
    get vehicle_models_url, as: :json
    assert_response :success
  end

  test 'should create vehicle_model' do
    assert_difference('VehicleModel.count') do
      post vehicle_models_url, params: { vehicle_model: {} }, as: :json
    end

    assert_response :created
  end

  test 'should show vehicle_model' do
    get vehicle_model_url(@vehicle_model), as: :json
    assert_response :success
  end

  test 'should update vehicle_model' do
    patch vehicle_model_url(@vehicle_model), params: { vehicle_model: {} }, as: :json
    assert_response :success
  end

  test 'should destroy vehicle_model' do
    assert_difference('VehicleModel.count', -1) do
      delete vehicle_model_url(@vehicle_model), as: :json
    end

    assert_response :no_content
  end
end
