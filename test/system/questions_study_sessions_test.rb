require "application_system_test_case"

class QuestionsStudySessionsTest < ApplicationSystemTestCase
  setup do
    @questions_study_session = questions_study_sessions(:one)
  end

  test "visiting the index" do
    visit questions_study_sessions_url
    assert_selector "h1", text: "Questions Study Sessions"
  end

  test "creating a Questions study session" do
    visit questions_study_sessions_url
    click_on "New Questions Study Session"

    fill_in "Question", with: @questions_study_session.question_id
    fill_in "Status", with: @questions_study_session.status
    fill_in "Study Session", with: @questions_study_session.study_session_id
    click_on "Create Questions study session"

    assert_text "Questions study session was successfully created"
    click_on "Back"
  end

  test "updating a Questions study session" do
    visit questions_study_sessions_url
    click_on "Edit", match: :first

    fill_in "Question", with: @questions_study_session.question_id
    fill_in "Status", with: @questions_study_session.status
    fill_in "Study Session", with: @questions_study_session.study_session_id
    click_on "Update Questions study session"

    assert_text "Questions study session was successfully updated"
    click_on "Back"
  end

  test "destroying a Questions study session" do
    visit questions_study_sessions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Questions study session was successfully destroyed"
  end
end
