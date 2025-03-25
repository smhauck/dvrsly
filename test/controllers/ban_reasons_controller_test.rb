require "test_helper"

class BanReasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ban_reason = ban_reasons(:one)
  end

  test "should get index" do
    get ban_reasons_url
    assert_response :success
  end

  test "should get new" do
    get new_ban_reason_url
    assert_response :success
  end

  test "should create ban_reason" do
    assert_difference("BanReason.count") do
      post ban_reasons_url, params: { ban_reason: { description: @ban_reason.description, name: @ban_reason.name } }
    end

    assert_redirected_to ban_reason_url(BanReason.last)
  end

  test "should show ban_reason" do
    get ban_reason_url(@ban_reason)
    assert_response :success
  end

  test "should get edit" do
    get edit_ban_reason_url(@ban_reason)
    assert_response :success
  end

  test "should update ban_reason" do
    patch ban_reason_url(@ban_reason), params: { ban_reason: { description: @ban_reason.description, name: @ban_reason.name } }
    assert_redirected_to ban_reason_url(@ban_reason)
  end

  test "should destroy ban_reason" do
    assert_difference("BanReason.count", -1) do
      delete ban_reason_url(@ban_reason)
    end

    assert_redirected_to ban_reasons_url
  end
end
