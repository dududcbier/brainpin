require "application_system_test_case"

class WrongAnswersTest < ApplicationSystemTestCase
  setup do
    @wrong_answer = wrong_answers(:one)
  end

  test "visiting the index" do
    visit wrong_answers_url
    assert_selector "h1", text: "Wrong Answers"
  end

  test "creating a Wrong answer" do
    visit wrong_answers_url
    click_on "New Wrong Answer"

    fill_in "Plausibility", with: @wrong_answer.plausibility
    fill_in "Text", with: @wrong_answer.text
    click_on "Create Wrong answer"

    assert_text "Wrong answer was successfully created"
    click_on "Back"
  end

  test "updating a Wrong answer" do
    visit wrong_answers_url
    click_on "Edit", match: :first

    fill_in "Plausibility", with: @wrong_answer.plausibility
    fill_in "Text", with: @wrong_answer.text
    click_on "Update Wrong answer"

    assert_text "Wrong answer was successfully updated"
    click_on "Back"
  end

  test "destroying a Wrong answer" do
    visit wrong_answers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wrong answer was successfully destroyed"
  end
end
