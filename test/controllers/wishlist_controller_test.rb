require "test_helper"

class WishlistControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get wishlist_show_url
    assert_response :success
  end
end
