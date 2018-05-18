require 'test_helper'

class AvatarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avatar = avatars(:one)
  end

  test "should get index" do
    get avatars_url
    assert_response :success
  end

  test "should get new" do
    get new_avatar_url
    assert_response :success
  end

  test "should create avatar" do
    assert_difference('Avatar.count') do
      post avatars_url, params: { avatar: { avatar_name: @avatar.avatar_name, img: @avatar.img } }
    end

    assert_redirected_to avatar_url(Avatar.last)
  end

  test "should show avatar" do
    get avatar_url(@avatar)
    assert_response :success
  end

  test "should get edit" do
    get edit_avatar_url(@avatar)
    assert_response :success
  end

  test "should update avatar" do
    patch avatar_url(@avatar), params: { avatar: { avatar_name: @avatar.avatar_name, img: @avatar.img } }
    assert_redirected_to avatar_url(@avatar)
  end

  test "should destroy avatar" do
    assert_difference('Avatar.count', -1) do
      delete avatar_url(@avatar)
    end

    assert_redirected_to avatars_url
  end
end
