require "application_system_test_case"

class LearnablesTest < ApplicationSystemTestCase
  setup do
    @learnable = learnables(:one)
  end

  test "visiting the index" do
    visit learnables_url
    assert_selector "h1", text: "Learnables"
  end

  test "creating a Learnable" do
    visit learnables_url
    click_on "New Learnable"

    fill_in "Id Coordinator", with: @learnable.id_coordinator
    fill_in "Learnable Name", with: @learnable.learnable_name
    fill_in "Max Level", with: @learnable.max_level
    click_on "Create Learnable"

    assert_text "Learnable was successfully created"
    click_on "Back"
  end

  test "updating a Learnable" do
    visit learnables_url
    click_on "Edit", match: :first

    fill_in "Id Coordinator", with: @learnable.id_coordinator
    fill_in "Learnable Name", with: @learnable.learnable_name
    fill_in "Max Level", with: @learnable.max_level
    click_on "Update Learnable"

    assert_text "Learnable was successfully updated"
    click_on "Back"
  end

  test "destroying a Learnable" do
    visit learnables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Learnable was successfully destroyed"
  end
end
