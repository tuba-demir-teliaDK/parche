require 'test_helper'

class CategoryProductsControllerTest < ActionController::TestCase
  setup do
    @category_product = category_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_product" do
    assert_difference('CategoryProduct.count') do
      post :create, category_product: @category_product.attributes
    end

    assert_redirected_to category_product_path(assigns(:category_product))
  end

  test "should show category_product" do
    get :show, id: @category_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_product
    assert_response :success
  end

  test "should update category_product" do
    put :update, id: @category_product, category_product: @category_product.attributes
    assert_redirected_to category_product_path(assigns(:category_product))
  end

  test "should destroy category_product" do
    assert_difference('CategoryProduct.count', -1) do
      delete :destroy, id: @category_product
    end

    assert_redirected_to category_products_path
  end
end
