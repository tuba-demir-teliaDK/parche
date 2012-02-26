require 'test_helper'

class VenueProductsControllerTest < ActionController::TestCase
  setup do
    @venue_product = venue_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venue_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create venue_product" do
    assert_difference('VenueProduct.count') do
      post :create, venue_product: @venue_product.attributes
    end

    assert_redirected_to venue_product_path(assigns(:venue_product))
  end

  test "should show venue_product" do
    get :show, id: @venue_product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @venue_product.to_param
    assert_response :success
  end

  test "should update venue_product" do
    put :update, id: @venue_product.to_param, venue_product: @venue_product.attributes
    assert_redirected_to venue_product_path(assigns(:venue_product))
  end

  test "should destroy venue_product" do
    assert_difference('VenueProduct.count', -1) do
      delete :destroy, id: @venue_product.to_param
    end

    assert_redirected_to venue_products_path
  end
end
