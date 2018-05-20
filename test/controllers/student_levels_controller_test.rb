require 'test_helper'

class StudentLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_level = student_levels(:one)
  end

  test "should get index" do
    get student_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_student_level_url
    assert_response :success
  end

  test "should create student_level" do
    assert_difference('StudentLevel.count') do
      post student_levels_url, params: { student_level: { learnable_id: @student_level.learnable_id, level: @student_level.level, points: @student_level.points, student_id: @student_level.student_id } }
    end

    assert_redirected_to student_level_url(StudentLevel.last)
  end

  test "should show student_level" do
    get student_level_url(@student_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_level_url(@student_level)
    assert_response :success
  end

  test "should update student_level" do
    patch student_level_url(@student_level), params: { student_level: { learnable_id: @student_level.learnable_id, level: @student_level.level, points: @student_level.points, student_id: @student_level.student_id } }
    assert_redirected_to student_level_url(@student_level)
  end

  test "should destroy student_level" do
    assert_difference('StudentLevel.count', -1) do
      delete student_level_url(@student_level)
    end

    assert_redirected_to student_levels_url
  end
end
