require 'test_helper'

class CoursesTeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courses_teacher = courses_teachers(:one)
  end

  test "should get index" do
    get courses_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_courses_teacher_url
    assert_response :success
  end

  test "should create courses_teacher" do
    assert_difference('CoursesTeacher.count') do
      post courses_teachers_url, params: { courses_teacher: { course_id: @courses_teacher.course_id, end_date: @courses_teacher.end_date, start_date: @courses_teacher.start_date, teacher_id: @courses_teacher.teacher_id } }
    end

    assert_redirected_to courses_teacher_url(CoursesTeacher.last)
  end

  test "should show courses_teacher" do
    get courses_teacher_url(@courses_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_courses_teacher_url(@courses_teacher)
    assert_response :success
  end

  test "should update courses_teacher" do
    patch courses_teacher_url(@courses_teacher), params: { courses_teacher: { course_id: @courses_teacher.course_id, end_date: @courses_teacher.end_date, start_date: @courses_teacher.start_date, teacher_id: @courses_teacher.teacher_id } }
    assert_redirected_to courses_teacher_url(@courses_teacher)
  end

  test "should destroy courses_teacher" do
    assert_difference('CoursesTeacher.count', -1) do
      delete courses_teacher_url(@courses_teacher)
    end

    assert_redirected_to courses_teachers_url
  end
end
