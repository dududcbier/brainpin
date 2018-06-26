require "application_system_test_case"

class RightAnswersTest < ApplicationSystemTestCase
  setup do
    @right_answer = right_answers(:one)
  end

  test "visiting the index" do
    visit right_answers_url
    assert_selector "h1", text: "Right Answers"
  end

  test "creating a Right answer" do
    visit right_answers_url
    click_on "New Right Answer"

    fill_in "Solutions", with: @right_answer.solutions_id
    fill_in "Text", with: @right_answer.text
    click_on "Create Right answer"

    assert_text "Right answer was successfully created"
    click_on "Back"
  end

  test "updating a Right answer" do
    visit right_answers_url
    click_on "Edit", match: :first

    fill_in "Solutions", with: @right_answer.solutions_id
    fill_in "Text", with: @right_answer.text
    click_on "Update Right answer"

    assert_text "Right answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Right answer" do
    visit right_answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Right answer was successfully destroyed"
  end
end
