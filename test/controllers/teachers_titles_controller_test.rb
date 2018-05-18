require 'test_helper'

class TeachersTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teachers_title = teachers_titles(:one)
  end

  test "should get index" do
    get teachers_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_teachers_title_url
    assert_response :success
  end

  test "should create teachers_title" do
    assert_difference('TeachersTitle.count') do
      post teachers_titles_url, params: { teachers_title: { id_teacher: @teachers_title.id_teacher, title: @teachers_title.title } }
    end

    assert_redirected_to teachers_title_url(TeachersTitle.last)
  end

  test "should show teachers_title" do
    get teachers_title_url(@teachers_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_teachers_title_url(@teachers_title)
    assert_response :success
  end

  test "should update teachers_title" do
    patch teachers_title_url(@teachers_title), params: { teachers_title: { id_teacher: @teachers_title.id_teacher, title: @teachers_title.title } }
    assert_redirected_to teachers_title_url(@teachers_title)
  end

  test "should destroy teachers_title" do
    assert_difference('TeachersTitle.count', -1) do
      delete teachers_title_url(@teachers_title)
    end

    assert_redirected_to teachers_titles_url
  end
end
