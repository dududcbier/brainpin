require "application_system_test_case"

class RegistrantsTest < ApplicationSystemTestCase
  setup do
    @registrant = registrants(:one)
  end

  test "visiting the index" do
    visit registrants_url
    assert_selector "h1", text: "Registrants"
  end

  test "creating a Registrant" do
    visit registrants_url
    click_on "New Registrant"

    click_on "Create Registrant"

    assert_text "Registrant was successfully created"
    click_on "Back"
  end

  test "updating a Registrant" do
    visit registrants_url
    click_on "Edit", match: :first

    click_on "Update Registrant"

    assert_text "Registrant was successfully updated"
    click_on "Back"
  end

  test "destroying a Registrant" do
    visit registrants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registrant was successfully destroyed"
  end
end
