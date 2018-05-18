require 'test_helper'

class RegistrantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registrant = registrants(:one)
  end

  test "should get index" do
    get registrants_url
    assert_response :success
  end

  test "should get new" do
    get new_registrant_url
    assert_response :success
  end

  test "should create registrant" do
    assert_difference('Registrant.count') do
      post registrants_url, params: { registrant: {  } }
    end

    assert_redirected_to registrant_url(Registrant.last)
  end

  test "should show registrant" do
    get registrant_url(@registrant)
    assert_response :success
  end

  test "should get edit" do
    get edit_registrant_url(@registrant)
    assert_response :success
  end

  test "should update registrant" do
    patch registrant_url(@registrant), params: { registrant: {  } }
    assert_redirected_to registrant_url(@registrant)
  end

  test "should destroy registrant" do
    assert_difference('Registrant.count', -1) do
      delete registrant_url(@registrant)
    end

    assert_redirected_to registrants_url
  end
end
