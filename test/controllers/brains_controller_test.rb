require "test_helper"

class BrainsControllerTest < ActionDispatch::IntegrationTest
  test "should get :new" do
    get brains_:new_url
    assert_response :success
  end

  test "should get :index" do
    get brains_:index_url
    assert_response :success
  end

  test "should get :edit" do
    get brains_:edit_url
    assert_response :success
  end
end
