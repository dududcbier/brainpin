require "application_system_test_case"

class TeachersTitlesTest < ApplicationSystemTestCase
  setup do
    @teachers_title = teachers_titles(:one)
  end

  test "visiting the index" do
    visit teachers_titles_url
    assert_selector "h1", text: "Teachers Titles"
  end

  test "creating a Teachers title" do
    visit teachers_titles_url
    click_on "New Teachers Title"

    fill_in "Teacher", with: @teachers_title.teacher_id
    fill_in "Title", with: @teachers_title.title
    click_on "Create Teachers title"

    assert_text "Teachers title was successfully created"
    click_on "Back"
  end

  test "updating a Teachers title" do
    visit teachers_titles_url
    click_on "Edit", match: :first

    fill_in "Teacher", with: @teachers_title.teacher_id
    fill_in "Title", with: @teachers_title.title
    click_on "Update Teachers title"

    assert_text "Teachers title was successfully updated"
    click_on "Back"
  end

  test "destroying a Teachers title" do
    visit teachers_titles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teachers title was successfully destroyed"
  end
end
