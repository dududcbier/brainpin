require 'test_helper'

class WrongAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wrong_answer = wrong_answers(:one)
  end

  test "should get index" do
    get wrong_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_wrong_answer_url
    assert_response :success
  end

  test "should create wrong_answer" do
    assert_difference('WrongAnswer.count') do
      post wrong_answers_url, params: { wrong_answer: { plausibility: @wrong_answer.plausibility, text: @wrong_answer.text } }
    end

    assert_redirected_to wrong_answer_url(WrongAnswer.last)
  end

  test "should show wrong_answer" do
    get wrong_answer_url(@wrong_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_wrong_answer_url(@wrong_answer)
    assert_response :success
  end

  test "should update wrong_answer" do
    patch wrong_answer_url(@wrong_answer), params: { wrong_answer: { plausibility: @wrong_answer.plausibility, text: @wrong_answer.text } }
    assert_redirected_to wrong_answer_url(@wrong_answer)
  end

  test "should destroy wrong_answer" do
    assert_difference('WrongAnswer.count', -1) do
      delete wrong_answer_url(@wrong_answer)
    end

    assert_redirected_to wrong_answers_url
  end
end
