require "application_system_test_case"

class BanReasonsTest < ApplicationSystemTestCase
  setup do
    @ban_reason = ban_reasons(:one)
  end

  test "visiting the index" do
    visit ban_reasons_url
    assert_selector "h1", text: "Ban reasons"
  end

  test "should create ban reason" do
    visit ban_reasons_url
    click_on "New ban reason"

    fill_in "Description", with: @ban_reason.description
    fill_in "Name", with: @ban_reason.name
    click_on "Create Ban reason"

    assert_text "Ban reason was successfully created"
    click_on "Back"
  end

  test "should update Ban reason" do
    visit ban_reason_url(@ban_reason)
    click_on "Edit this ban reason", match: :first

    fill_in "Description", with: @ban_reason.description
    fill_in "Name", with: @ban_reason.name
    click_on "Update Ban reason"

    assert_text "Ban reason was successfully updated"
    click_on "Back"
  end

  test "should destroy Ban reason" do
    visit ban_reason_url(@ban_reason)
    click_on "Destroy this ban reason", match: :first

    assert_text "Ban reason was successfully destroyed"
  end
end
