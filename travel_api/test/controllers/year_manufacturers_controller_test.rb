require "test_helper"

class YearManufacturersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @year_manufacturer = year_manufacturers(:one)
  end

  test "should get index" do
    get year_manufacturers_url, as: :json
    assert_response :success
  end

  test "should create year_manufacturer" do
    assert_difference("YearManufacturer.count") do
      post year_manufacturers_url, params: { year_manufacturer: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show year_manufacturer" do
    get year_manufacturer_url(@year_manufacturer), as: :json
    assert_response :success
  end

  test "should update year_manufacturer" do
    patch year_manufacturer_url(@year_manufacturer), params: { year_manufacturer: {  } }, as: :json
    assert_response :success
  end

  test "should destroy year_manufacturer" do
    assert_difference("YearManufacturer.count", -1) do
      delete year_manufacturer_url(@year_manufacturer), as: :json
    end

    assert_response :no_content
  end
end
