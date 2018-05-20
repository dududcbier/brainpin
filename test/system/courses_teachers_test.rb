require "application_system_test_case"

class CoursesTeachersTest < ApplicationSystemTestCase
  setup do
    @courses_teacher = courses_teachers(:one)
  end

  test "visiting the index" do
    visit courses_teachers_url
    assert_selector "h1", text: "Courses Teachers"
  end

  test "creating a Courses teacher" do
    visit courses_teachers_url
    click_on "New Courses Teacher"

    fill_in "Course", with: @courses_teacher.course_id
    fill_in "End Date", with: @courses_teacher.end_date
    fill_in "Start Date", with: @courses_teacher.start_date
    fill_in "Teacher", with: @courses_teacher.teacher_id
    click_on "Create Courses teacher"

    assert_text "Courses teacher was successfully created"
    click_on "Back"
  end

  test "updating a Courses teacher" do
    visit courses_teachers_url
    click_on "Edit", match: :first

    fill_in "Course", with: @courses_teacher.course_id
    fill_in "End Date", with: @courses_teacher.end_date
    fill_in "Start Date", with: @courses_teacher.start_date
    fill_in "Teacher", with: @courses_teacher.teacher_id
    click_on "Update Courses teacher"

    assert_text "Courses teacher was successfully updated"
    click_on "Back"
  end

  test "destroying a Courses teacher" do
    visit courses_teachers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Courses teacher was successfully destroyed"
  end
end
