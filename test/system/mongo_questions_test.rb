require "application_system_test_case"

class MongoQuestionsTest < ApplicationSystemTestCase
  setup do
    @mongo_question = mongo_questions(:one)
  end

  test "visiting the index" do
    visit mongo_questions_url
    assert_selector "h1", text: "Mongo Questions"
  end

  test "creating a Mongo question" do
    visit mongo_questions_url
    click_on "New Mongo Question"

    fill_in "Difficulty", with: @mongo_question.difficulty
    fill_in "Points", with: @mongo_question.points
    fill_in "Rating", with: @mongo_question.rating
    fill_in "Text", with: @mongo_question.text
    click_on "Create Mongo question"

    assert_text "Mongo question was successfully created"
    click_on "Back"
  end

  test "updating a Mongo question" do
    visit mongo_questions_url
    click_on "Edit", match: :first

    fill_in "Difficulty", with: @mongo_question.difficulty
    fill_in "Points", with: @mongo_question.points
    fill_in "Rating", with: @mongo_question.rating
    fill_in "Text", with: @mongo_question.text
    click_on "Update Mongo question"

    assert_text "Mongo question was successfully updated"
    click_on "Back"
  end

  test "destroying a Mongo question" do
    visit mongo_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mongo question was successfully destroyed"
  end
end
