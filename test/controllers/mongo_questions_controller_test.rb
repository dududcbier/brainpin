require 'test_helper'

class MongoQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mongo_question = mongo_questions(:one)
  end

  test "should get index" do
    get mongo_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_mongo_question_url
    assert_response :success
  end

  test "should create mongo_question" do
    assert_difference('MongoQuestion.count') do
      post mongo_questions_url, params: { mongo_question: { difficulty: @mongo_question.difficulty, points: @mongo_question.points, rating: @mongo_question.rating, text: @mongo_question.text } }
    end

    assert_redirected_to mongo_question_url(MongoQuestion.last)
  end

  test "should show mongo_question" do
    get mongo_question_url(@mongo_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_mongo_question_url(@mongo_question)
    assert_response :success
  end

  test "should update mongo_question" do
    patch mongo_question_url(@mongo_question), params: { mongo_question: { difficulty: @mongo_question.difficulty, points: @mongo_question.points, rating: @mongo_question.rating, text: @mongo_question.text } }
    assert_redirected_to mongo_question_url(@mongo_question)
  end

  test "should destroy mongo_question" do
    assert_difference('MongoQuestion.count', -1) do
      delete mongo_question_url(@mongo_question)
    end

    assert_redirected_to mongo_questions_url
  end
end
