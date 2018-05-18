require "application_system_test_case"

class SubtopicsQuestionsTest < ApplicationSystemTestCase
  setup do
    @subtopics_question = subtopics_questions(:one)
  end

  test "visiting the index" do
    visit subtopics_questions_url
    assert_selector "h1", text: "Subtopics Questions"
  end

  test "creating a Subtopics question" do
    visit subtopics_questions_url
    click_on "New Subtopics Question"

    fill_in "Id Question", with: @subtopics_question.id_question
    fill_in "Id Subtopic", with: @subtopics_question.id_subtopic
    click_on "Create Subtopics question"

    assert_text "Subtopics question was successfully created"
    click_on "Back"
  end

  test "updating a Subtopics question" do
    visit subtopics_questions_url
    click_on "Edit", match: :first

    fill_in "Id Question", with: @subtopics_question.id_question
    fill_in "Id Subtopic", with: @subtopics_question.id_subtopic
    click_on "Update Subtopics question"

    assert_text "Subtopics question was successfully updated"
    click_on "Back"
  end

  test "destroying a Subtopics question" do
    visit subtopics_questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subtopics question was successfully destroyed"
  end
end
