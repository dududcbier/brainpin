require 'test_helper'

class QuestionsStudySessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questions_study_session = questions_study_sessions(:one)
  end

  test "should get index" do
    get questions_study_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_questions_study_session_url
    assert_response :success
  end

  test "should create questions_study_session" do
    assert_difference('QuestionsStudySession.count') do
      post questions_study_sessions_url, params: { questions_study_session: { id_question: @questions_study_session.id_question, id_study_session: @questions_study_session.id_study_session, status: @questions_study_session.status } }
    end

    assert_redirected_to questions_study_session_url(QuestionsStudySession.last)
  end

  test "should show questions_study_session" do
    get questions_study_session_url(@questions_study_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_questions_study_session_url(@questions_study_session)
    assert_response :success
  end

  test "should update questions_study_session" do
    patch questions_study_session_url(@questions_study_session), params: { questions_study_session: { id_question: @questions_study_session.id_question, id_study_session: @questions_study_session.id_study_session, status: @questions_study_session.status } }
    assert_redirected_to questions_study_session_url(@questions_study_session)
  end

  test "should destroy questions_study_session" do
    assert_difference('QuestionsStudySession.count', -1) do
      delete questions_study_session_url(@questions_study_session)
    end

    assert_redirected_to questions_study_sessions_url
  end
end
