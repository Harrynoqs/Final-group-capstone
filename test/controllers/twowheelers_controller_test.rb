require "test_helper"

class TwowheelersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twowheeler = twowheelers(:one)
  end

  test "should get index" do
    get twowheelers_url
    assert_response :success
  end

  test "should get new" do
    get new_twowheeler_url
    assert_response :success
  end

  test "should create twowheeler" do
    assert_difference("Twowheeler.count") do
      post twowheelers_url, params: { twowheeler: { description: @twowheeler.description, engine_type: @twowheeler.engine_type, fuel_type: @twowheeler.fuel_type, image_url: @twowheeler.image_url, model_year: @twowheeler.model_year, name: @twowheeler.name, price: @twowheeler.price } }
    end

    assert_redirected_to twowheeler_url(Twowheeler.last)
  end

  test "should show twowheeler" do
    get twowheeler_url(@twowheeler)
    assert_response :success
  end

  test "should get edit" do
    get edit_twowheeler_url(@twowheeler)
    assert_response :success
  end

  test "should update twowheeler" do
    patch twowheeler_url(@twowheeler), params: { twowheeler: { description: @twowheeler.description, engine_type: @twowheeler.engine_type, fuel_type: @twowheeler.fuel_type, image_url: @twowheeler.image_url, model_year: @twowheeler.model_year, name: @twowheeler.name, price: @twowheeler.price } }
    assert_redirected_to twowheeler_url(@twowheeler)
  end

  test "should destroy twowheeler" do
    assert_difference("Twowheeler.count", -1) do
      delete twowheeler_url(@twowheeler)
    end

    assert_redirected_to twowheelers_url
  end
end
