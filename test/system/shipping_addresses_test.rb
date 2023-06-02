require "application_system_test_case"

class ShippingAddressesTest < ApplicationSystemTestCase
  setup do
    @shipping_address = shipping_addresses(:one)
  end

  test "visiting the index" do
    visit shipping_addresses_url
    assert_selector "h1", text: "Shipping addresses"
  end

  test "should create shipping address" do
    visit shipping_addresses_url
    click_on "New shipping address"

    click_on "Create Shipping address"

    assert_text "Shipping address was successfully created"
    click_on "Back"
  end

  test "should update Shipping address" do
    visit shipping_address_url(@shipping_address)
    click_on "Edit this shipping address", match: :first

    click_on "Update Shipping address"

    assert_text "Shipping address was successfully updated"
    click_on "Back"
  end

  test "should destroy Shipping address" do
    visit shipping_address_url(@shipping_address)
    click_on "Destroy this shipping address", match: :first

    assert_text "Shipping address was successfully destroyed"
  end
end
