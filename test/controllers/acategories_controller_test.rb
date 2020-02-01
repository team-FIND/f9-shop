require 'test_helper'

class AcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acategory = acategories(:one)
  end

  test "should get index" do
    get acategories_url
    assert_response :success
  end

  test "should get new" do
    get new_acategory_url
    assert_response :success
  end

  test "should create acategory" do
    assert_difference('Acategory.count') do
      post acategories_url, params: { acategory: { category_id: @acategory.category_id, name: @acategory.name } }
    end

    assert_redirected_to acategory_url(Acategory.last)
  end

  test "should show acategory" do
    get acategory_url(@acategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_acategory_url(@acategory)
    assert_response :success
  end

  test "should update acategory" do
    patch acategory_url(@acategory), params: { acategory: { category_id: @acategory.category_id, name: @acategory.name } }
    assert_redirected_to acategory_url(@acategory)
  end

  test "should destroy acategory" do
    assert_difference('Acategory.count', -1) do
      delete acategory_url(@acategory)
    end

    assert_redirected_to acategories_url
  end
end
