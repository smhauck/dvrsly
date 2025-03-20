require "test_helper"

class DiversionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diversion = diversions(:one)
  end

  test "should get index" do
    get diversions_url
    assert_response :success
  end

  test "should get new" do
    get new_diversion_url
    assert_response :success
  end

  test "should create diversion" do
    assert_difference("Diversion.count") do
      post diversions_url, params: { diversion: { description: @diversion.description, title: @diversion.title, user_id: @diversion.user_id } }
    end

    assert_redirected_to diversion_url(Diversion.last)
  end

  test "should show diversion" do
    get diversion_url(@diversion)
    assert_response :success
  end

  test "should get edit" do
    get edit_diversion_url(@diversion)
    assert_response :success
  end

  test "should update diversion" do
    patch diversion_url(@diversion), params: { diversion: { description: @diversion.description, title: @diversion.title, user_id: @diversion.user_id } }
    assert_redirected_to diversion_url(@diversion)
  end

  test "should destroy diversion" do
    assert_difference("Diversion.count", -1) do
      delete diversion_url(@diversion)
    end

    assert_redirected_to diversions_url
  end
end
