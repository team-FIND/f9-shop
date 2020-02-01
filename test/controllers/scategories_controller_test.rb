require 'test_helper'

class ScategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scategory = scategories(:one)
  end

  test "should get index" do
    get scategories_url
    assert_response :success
  end

  test "should get new" do
    get new_scategory_url
    assert_response :success
  end

  test "should create scategory" do
    assert_difference('Scategory.count') do
      post scategories_url, params: { scategory: { category_id: @scategory.category_id, name: @scategory.name } }
    end

    assert_redirected_to scategory_url(Scategory.last)
  end

  test "should show scategory" do
    get scategory_url(@scategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_scategory_url(@scategory)
    assert_response :success
  end

  test "should update scategory" do
    patch scategory_url(@scategory), params: { scategory: { category_id: @scategory.category_id, name: @scategory.name } }
    assert_redirected_to scategory_url(@scategory)
  end

  test "should destroy scategory" do
    assert_difference('Scategory.count', -1) do
      delete scategory_url(@scategory)
    end

    assert_redirected_to scategories_url
  end
end
