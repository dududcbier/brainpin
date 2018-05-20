require "application_system_test_case"

class StudySessionsTest < ApplicationSystemTestCase
  setup do
    @study_session = study_sessions(:one)
  end

  test "visiting the index" do
    visit study_sessions_url
    assert_selector "h1", text: "Study Sessions"
  end

  test "creating a Study session" do
    visit study_sessions_url
    click_on "New Study Session"

    fill_in "End Date", with: @study_session.end_date
    fill_in "Num Correct", with: @study_session.num_correct
    fill_in "Num Questions", with: @study_session.num_questions
    fill_in "Start Date", with: @study_session.start_date
    fill_in "Student", with: @study_session.student_id
    fill_in "Subtopic", with: @study_session.subtopic_id
    click_on "Create Study session"

    assert_text "Study session was successfully created"
    click_on "Back"
  end

  test "updating a Study session" do
    visit study_sessions_url
    click_on "Edit", match: :first

    fill_in "End Date", with: @study_session.end_date
    fill_in "Num Correct", with: @study_session.num_correct
    fill_in "Num Questions", with: @study_session.num_questions
    fill_in "Start Date", with: @study_session.start_date
    fill_in "Student", with: @study_session.student_id
    fill_in "Subtopic", with: @study_session.subtopic_id
    click_on "Update Study session"

    assert_text "Study session was successfully updated"
    click_on "Back"
  end

  test "destroying a Study session" do
    visit study_sessions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Study session was successfully destroyed"
  end
end
