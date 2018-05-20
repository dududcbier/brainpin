require "application_system_test_case"

class MaterialsRatingsTest < ApplicationSystemTestCase
  setup do
    @materials_rating = materials_ratings(:one)
  end

  test "visiting the index" do
    visit materials_ratings_url
    assert_selector "h1", text: "Materials Ratings"
  end

  test "creating a Materials rating" do
    visit materials_ratings_url
    click_on "New Materials Rating"

    fill_in "Material", with: @materials_rating.material_id
    fill_in "Rating", with: @materials_rating.rating
    fill_in "Student", with: @materials_rating.student_id
    click_on "Create Materials rating"

    assert_text "Materials rating was successfully created"
    click_on "Back"
  end

  test "updating a Materials rating" do
    visit materials_ratings_url
    click_on "Edit", match: :first

    fill_in "Material", with: @materials_rating.material_id
    fill_in "Rating", with: @materials_rating.rating
    fill_in "Student", with: @materials_rating.student_id
    click_on "Update Materials rating"

    assert_text "Materials rating was successfully updated"
    click_on "Back"
  end

  test "destroying a Materials rating" do
    visit materials_ratings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Materials rating was successfully destroyed"
  end
end
