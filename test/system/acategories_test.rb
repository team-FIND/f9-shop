require "application_system_test_case"

class AcategoriesTest < ApplicationSystemTestCase
  setup do
    @acategory = acategories(:one)
  end

  test "visiting the index" do
    visit acategories_url
    assert_selector "h1", text: "Acategories"
  end

  test "creating a Acategory" do
    visit acategories_url
    click_on "New Acategory"

    fill_in "Category", with: @acategory.category_id
    fill_in "Name", with: @acategory.name
    click_on "Create Acategory"

    assert_text "Acategory was successfully created"
    click_on "Back"
  end

  test "updating a Acategory" do
    visit acategories_url
    click_on "Edit", match: :first

    fill_in "Category", with: @acategory.category_id
    fill_in "Name", with: @acategory.name
    click_on "Update Acategory"

    assert_text "Acategory was successfully updated"
    click_on "Back"
  end

  test "destroying a Acategory" do
    visit acategories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Acategory was successfully destroyed"
  end
end
