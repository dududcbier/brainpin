require 'test_helper'

class SubtopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subtopic = subtopics(:one)
  end

  test "should get index" do
    get subtopics_url
    assert_response :success
  end

  test "should get new" do
    get new_subtopic_url
    assert_response :success
  end

  test "should create subtopic" do
    assert_difference('Subtopic.count') do
      post subtopics_url, params: { subtopic: { topic_id: @subtopic.topic_id } }
    end

    assert_redirected_to subtopic_url(Subtopic.last)
  end

  test "should show subtopic" do
    get subtopic_url(@subtopic)
    assert_response :success
  end

  test "should get edit" do
    get edit_subtopic_url(@subtopic)
    assert_response :success
  end

  test "should update subtopic" do
    patch subtopic_url(@subtopic), params: { subtopic: { topic_id: @subtopic.topic_id } }
    assert_redirected_to subtopic_url(@subtopic)
  end

  test "should destroy subtopic" do
    assert_difference('Subtopic.count', -1) do
      delete subtopic_url(@subtopic)
    end

    assert_redirected_to subtopics_url
  end
end
