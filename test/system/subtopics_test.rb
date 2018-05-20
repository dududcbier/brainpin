require "application_system_test_case"

class SubtopicsTest < ApplicationSystemTestCase
  setup do
    @subtopic = subtopics(:one)
  end

  test "visiting the index" do
    visit subtopics_url
    assert_selector "h1", text: "Subtopics"
  end

  test "creating a Subtopic" do
    visit subtopics_url
    click_on "New Subtopic"

    fill_in "Topic", with: @subtopic.topic_id
    click_on "Create Subtopic"

    assert_text "Subtopic was successfully created"
    click_on "Back"
  end

  test "updating a Subtopic" do
    visit subtopics_url
    click_on "Edit", match: :first

    fill_in "Topic", with: @subtopic.topic_id
    click_on "Update Subtopic"

    assert_text "Subtopic was successfully updated"
    click_on "Back"
  end

  test "destroying a Subtopic" do
    visit subtopics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subtopic was successfully destroyed"
  end
end
