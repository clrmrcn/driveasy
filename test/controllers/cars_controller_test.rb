require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cars_index_url
    assert_response :success
  end

  test "should get shox" do
    get cars_shox_url
    assert_response :success
  end
end
