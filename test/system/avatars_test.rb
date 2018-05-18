require "application_system_test_case"

class AvatarsTest < ApplicationSystemTestCase
  setup do
    @avatar = avatars(:one)
  end

  test "visiting the index" do
    visit avatars_url
    assert_selector "h1", text: "Avatars"
  end

  test "creating a Avatar" do
    visit avatars_url
    click_on "New Avatar"

    fill_in "Avatar Name", with: @avatar.avatar_name
    fill_in "Img", with: @avatar.img
    click_on "Create Avatar"

    assert_text "Avatar was successfully created"
    click_on "Back"
  end

  test "updating a Avatar" do
    visit avatars_url
    click_on "Edit", match: :first

    fill_in "Avatar Name", with: @avatar.avatar_name
    fill_in "Img", with: @avatar.img
    click_on "Update Avatar"

    assert_text "Avatar was successfully updated"
    click_on "Back"
  end

  test "destroying a Avatar" do
    visit avatars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Avatar was successfully destroyed"
  end
end
