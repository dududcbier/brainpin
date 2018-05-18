require 'test_helper'

class LevelsPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @levels_point = levels_points(:one)
  end

  test "should get index" do
    get levels_points_url
    assert_response :success
  end

  test "should get new" do
    get new_levels_point_url
    assert_response :success
  end

  test "should create levels_point" do
    assert_difference('LevelsPoint.count') do
      post levels_points_url, params: { levels_point: { id_learnable: @levels_point.id_learnable, level: @levels_point.level, points: @levels_point.points } }
    end

    assert_redirected_to levels_point_url(LevelsPoint.last)
  end

  test "should show levels_point" do
    get levels_point_url(@levels_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_levels_point_url(@levels_point)
    assert_response :success
  end

  test "should update levels_point" do
    patch levels_point_url(@levels_point), params: { levels_point: { id_learnable: @levels_point.id_learnable, level: @levels_point.level, points: @levels_point.points } }
    assert_redirected_to levels_point_url(@levels_point)
  end

  test "should destroy levels_point" do
    assert_difference('LevelsPoint.count', -1) do
      delete levels_point_url(@levels_point)
    end

    assert_redirected_to levels_points_url
  end
end
