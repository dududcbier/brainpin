require 'test_helper'

class SubtopicsQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subtopics_question = subtopics_questions(:one)
  end

  test "should get index" do
    get subtopics_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_subtopics_question_url
    assert_response :success
  end

  test "should create subtopics_question" do
    assert_difference('SubtopicsQuestion.count') do
      post subtopics_questions_url, params: { subtopics_question: { id_question: @subtopics_question.id_question, id_subtopic: @subtopics_question.id_subtopic } }
    end

    assert_redirected_to subtopics_question_url(SubtopicsQuestion.last)
  end

  test "should show subtopics_question" do
    get subtopics_question_url(@subtopics_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_subtopics_question_url(@subtopics_question)
    assert_response :success
  end

  test "should update subtopics_question" do
    patch subtopics_question_url(@subtopics_question), params: { subtopics_question: { id_question: @subtopics_question.id_question, id_subtopic: @subtopics_question.id_subtopic } }
    assert_redirected_to subtopics_question_url(@subtopics_question)
  end

  test "should destroy subtopics_question" do
    assert_difference('SubtopicsQuestion.count', -1) do
      delete subtopics_question_url(@subtopics_question)
    end

    assert_redirected_to subtopics_questions_url
  end
end
