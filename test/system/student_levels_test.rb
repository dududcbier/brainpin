require "application_system_test_case"

class StudentLevelsTest < ApplicationSystemTestCase
  setup do
    @student_level = student_levels(:one)
  end

  test "visiting the index" do
    visit student_levels_url
    assert_selector "h1", text: "Student Levels"
  end

  test "creating a Student level" do
    visit student_levels_url
    click_on "New Student Level"

    fill_in "Learnable", with: @student_level.learnable_id
    fill_in "Level", with: @student_level.level
    fill_in "Points", with: @student_level.points
    fill_in "Student", with: @student_level.student_id
    click_on "Create Student level"

    assert_text "Student level was successfully created"
    click_on "Back"
  end

  test "updating a Student level" do
    visit student_levels_url
    click_on "Edit", match: :first

    fill_in "Learnable", with: @student_level.learnable_id
    fill_in "Level", with: @student_level.level
    fill_in "Points", with: @student_level.points
    fill_in "Student", with: @student_level.student_id
    click_on "Update Student level"

    assert_text "Student level was successfully updated"
    click_on "Back"
  end

  test "destroying a Student level" do
    visit student_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student level was successfully destroyed"
  end
end
