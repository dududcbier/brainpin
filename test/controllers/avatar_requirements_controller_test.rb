require 'test_helper'

class AvatarRequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avatar_requirement = avatar_requirements(:one)
  end

  test "should get index" do
    get avatar_requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_avatar_requirement_url
    assert_response :success
  end

  test "should create avatar_requirement" do
    assert_difference('AvatarRequirement.count') do
      post avatar_requirements_url, params: { avatar_requirement: { avatar_id: @avatar_requirement.avatar_id, learnable_id: @avatar_requirement.learnable_id, min_level: @avatar_requirement.min_level } }
    end

    assert_redirected_to avatar_requirement_url(AvatarRequirement.last)
  end

  test "should show avatar_requirement" do
    get avatar_requirement_url(@avatar_requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_avatar_requirement_url(@avatar_requirement)
    assert_response :success
  end

  test "should update avatar_requirement" do
    patch avatar_requirement_url(@avatar_requirement), params: { avatar_requirement: { avatar_id: @avatar_requirement.avatar_id, learnable_id: @avatar_requirement.learnable_id, min_level: @avatar_requirement.min_level } }
    assert_redirected_to avatar_requirement_url(@avatar_requirement)
  end

  test "should destroy avatar_requirement" do
    assert_difference('AvatarRequirement.count', -1) do
      delete avatar_requirement_url(@avatar_requirement)
    end

    assert_redirected_to avatar_requirements_url
  end
end
