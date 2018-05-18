require "application_system_test_case"

class AvatarRequirementsTest < ApplicationSystemTestCase
  setup do
    @avatar_requirement = avatar_requirements(:one)
  end

  test "visiting the index" do
    visit avatar_requirements_url
    assert_selector "h1", text: "Avatar Requirements"
  end

  test "creating a Avatar requirement" do
    visit avatar_requirements_url
    click_on "New Avatar Requirement"

    fill_in "Id Avatar", with: @avatar_requirement.id_avatar
    fill_in "Id Learnable", with: @avatar_requirement.id_learnable
    fill_in "Min Level", with: @avatar_requirement.min_level
    click_on "Create Avatar requirement"

    assert_text "Avatar requirement was successfully created"
    click_on "Back"
  end

  test "updating a Avatar requirement" do
    visit avatar_requirements_url
    click_on "Edit", match: :first

    fill_in "Id Avatar", with: @avatar_requirement.id_avatar
    fill_in "Id Learnable", with: @avatar_requirement.id_learnable
    fill_in "Min Level", with: @avatar_requirement.min_level
    click_on "Update Avatar requirement"

    assert_text "Avatar requirement was successfully updated"
    click_on "Back"
  end

  test "destroying a Avatar requirement" do
    visit avatar_requirements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Avatar requirement was successfully destroyed"
  end
end
