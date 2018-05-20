require 'test_helper'

class StudySessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_session = study_sessions(:one)
  end

  test "should get index" do
    get study_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_study_session_url
    assert_response :success
  end

  test "should create study_session" do
    assert_difference('StudySession.count') do
      post study_sessions_url, params: { study_session: { end_date: @study_session.end_date, num_correct: @study_session.num_correct, num_questions: @study_session.num_questions, start_date: @study_session.start_date, student_id: @study_session.student_id, subtopic_id: @study_session.subtopic_id } }
    end

    assert_redirected_to study_session_url(StudySession.last)
  end

  test "should show study_session" do
    get study_session_url(@study_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_session_url(@study_session)
    assert_response :success
  end

  test "should update study_session" do
    patch study_session_url(@study_session), params: { study_session: { end_date: @study_session.end_date, num_correct: @study_session.num_correct, num_questions: @study_session.num_questions, start_date: @study_session.start_date, student_id: @study_session.student_id, subtopic_id: @study_session.subtopic_id } }
    assert_redirected_to study_session_url(@study_session)
  end

  test "should destroy study_session" do
    assert_difference('StudySession.count', -1) do
      delete study_session_url(@study_session)
    end

    assert_redirected_to study_sessions_url
  end
end
