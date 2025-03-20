require "application_system_test_case"

class DiversionsTest < ApplicationSystemTestCase
  setup do
    @diversion = diversions(:one)
  end

  test "visiting the index" do
    visit diversions_url
    assert_selector "h1", text: "Diversions"
  end

  test "should create diversion" do
    visit diversions_url
    click_on "New diversion"

    fill_in "Description", with: @diversion.description
    fill_in "Title", with: @diversion.title
    fill_in "User", with: @diversion.user_id
    click_on "Create Diversion"

    assert_text "Diversion was successfully created"
    click_on "Back"
  end

  test "should update Diversion" do
    visit diversion_url(@diversion)
    click_on "Edit this diversion", match: :first

    fill_in "Description", with: @diversion.description
    fill_in "Title", with: @diversion.title
    fill_in "User", with: @diversion.user_id
    click_on "Update Diversion"

    assert_text "Diversion was successfully updated"
    click_on "Back"
  end

  test "should destroy Diversion" do
    visit diversion_url(@diversion)
    click_on "Destroy this diversion", match: :first

    assert_text "Diversion was successfully destroyed"
  end
end
