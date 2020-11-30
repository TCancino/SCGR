require "application_system_test_case"

class PostulationsTest < ApplicationSystemTestCase
  setup do
    @postulation = postulations(:one)
  end

  test "visiting the index" do
    visit postulations_url
    assert_selector "h1", text: "Postulations"
  end

  test "creating a Postulation" do
    visit postulations_url
    click_on "New Postulation"

    click_on "Create Postulation"

    assert_text "Postulation was successfully created"
    click_on "Back"
  end

  test "updating a Postulation" do
    visit postulations_url
    click_on "Edit", match: :first

    click_on "Update Postulation"

    assert_text "Postulation was successfully updated"
    click_on "Back"
  end

  test "destroying a Postulation" do
    visit postulations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Postulation was successfully destroyed"
  end
end
