require 'test_helper'

class LearnablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learnable = learnables(:one)
  end

  test "should get index" do
    get learnables_url
    assert_response :success
  end

  test "should get new" do
    get new_learnable_url
    assert_response :success
  end

  test "should create learnable" do
    assert_difference('Learnable.count') do
      post learnables_url, params: { learnable: { id_coordinator: @learnable.id_coordinator, learnable_name: @learnable.learnable_name, max_level: @learnable.max_level } }
    end

    assert_redirected_to learnable_url(Learnable.last)
  end

  test "should show learnable" do
    get learnable_url(@learnable)
    assert_response :success
  end

  test "should get edit" do
    get edit_learnable_url(@learnable)
    assert_response :success
  end

  test "should update learnable" do
    patch learnable_url(@learnable), params: { learnable: { id_coordinator: @learnable.id_coordinator, learnable_name: @learnable.learnable_name, max_level: @learnable.max_level } }
    assert_redirected_to learnable_url(@learnable)
  end

  test "should destroy learnable" do
    assert_difference('Learnable.count', -1) do
      delete learnable_url(@learnable)
    end

    assert_redirected_to learnables_url
  end
end
