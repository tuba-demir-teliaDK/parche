require 'test_helper'

class VenueCategoriesControllerTest < ActionController::TestCase
  setup do
    @venue_category = venue_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venue_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue_category" do
    assert_difference('VenueCategory.count') do
      post :create, venue_category: @venue_category.attributes
    end

    assert_redirected_to venue_category_path(assigns(:venue_category))
  end

  test "should show venue_category" do
    get :show, id: @venue_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @venue_category
    assert_response :success
  end

  test "should update venue_category" do
    put :update, id: @venue_category, venue_category: @venue_category.attributes
    assert_redirected_to venue_category_path(assigns(:venue_category))
  end

  test "should destroy venue_category" do
    assert_difference('VenueCategory.count', -1) do
      delete :destroy, id: @venue_category
    end

    assert_redirected_to venue_categories_path
  end
end
