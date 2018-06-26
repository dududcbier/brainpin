require 'test_helper'

class RightAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @right_answer = right_answers(:one)
  end

  test "should get index" do
    get right_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_right_answer_url
    assert_response :success
  end

  test "should create right_answer" do
    assert_difference('RightAnswer.count') do
      post right_answers_url, params: { right_answer: { solutions_id: @right_answer.solutions_id, text: @right_answer.text } }
    end

    assert_redirected_to right_answer_url(RightAnswer.last)
  end

  test "should show right_answer" do
    get right_answer_url(@right_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_right_answer_url(@right_answer)
    assert_response :success
  end

  test "should update right_answer" do
    patch right_answer_url(@right_answer), params: { right_answer: { solutions_id: @right_answer.solutions_id, text: @right_answer.text } }
    assert_redirected_to right_answer_url(@right_answer)
  end

  test "should destroy right_answer" do
    assert_difference('RightAnswer.count', -1) do
      delete right_answer_url(@right_answer)
    end

    assert_redirected_to right_answers_url
  end
end
