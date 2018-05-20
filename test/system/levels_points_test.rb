require "application_system_test_case"

class LevelsPointsTest < ApplicationSystemTestCase
  setup do
    @levels_point = levels_points(:one)
  end

  test "visiting the index" do
    visit levels_points_url
    assert_selector "h1", text: "Levels Points"
  end

  test "creating a Levels point" do
    visit levels_points_url
    click_on "New Levels Point"

    fill_in "Learnable", with: @levels_point.learnable_id
    fill_in "Level", with: @levels_point.level
    fill_in "Points", with: @levels_point.points
    click_on "Create Levels point"

    assert_text "Levels point was successfully created"
    click_on "Back"
  end

  test "updating a Levels point" do
    visit levels_points_url
    click_on "Edit", match: :first

    fill_in "Learnable", with: @levels_point.learnable_id
    fill_in "Level", with: @levels_point.level
    fill_in "Points", with: @levels_point.points
    click_on "Update Levels point"

    assert_text "Levels point was successfully updated"
    click_on "Back"
  end

  test "destroying a Levels point" do
    visit levels_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Levels point was successfully destroyed"
  end
end
