require "test_helper"

class WishlistProductControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get wishlist_product_show_url
    assert_response :success
  end
end
