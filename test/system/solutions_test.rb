require "application_system_test_case"

class SolutionsTest < ApplicationSystemTestCase
  setup do
    @solution = solutions(:one)
  end

  test "visiting the index" do
    visit solutions_url
    assert_selector "h1", text: "Solutions"
  end

  test "creating a Solution" do
    visit solutions_url
    click_on "New Solution"

    fill_in "Text", with: @solution.text
    click_on "Create Solution"

    assert_text "Solution was successfully created"
    click_on "Back"
  end

  test "updating a Solution" do
    visit solutions_url
    click_on "Edit", match: :first

    fill_in "Text", with: @solution.text
    click_on "Update Solution"

    assert_text "Solution was successfully updated"
    click_on "Back"
  end

  test "destroying a Solution" do
    visit solutions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Solution was successfully destroyed"
  end
end
