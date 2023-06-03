require "application_system_test_case"

class BillingAddressesTest < ApplicationSystemTestCase
  setup do
    @billing_address = billing_addresses(:one)
  end

  test "visiting the index" do
    visit billing_addresses_url
    assert_selector "h1", text: "Billing addresses"
  end

  test "should create billing address" do
    visit billing_addresses_url
    click_on "New billing address"

    click_on "Create Billing address"

    assert_text "Billing address was successfully created"
    click_on "Back"
  end

  test "should update Billing address" do
    visit billing_address_url(@billing_address)
    click_on "Edit this billing address", match: :first

    click_on "Update Billing address"

    assert_text "Billing address was successfully updated"
    click_on "Back"
  end

  test "should destroy Billing address" do
    visit billing_address_url(@billing_address)
    click_on "Destroy this billing address", match: :first

    assert_text "Billing address was successfully destroyed"
  end
end
