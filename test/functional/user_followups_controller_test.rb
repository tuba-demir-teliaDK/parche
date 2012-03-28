require 'test_helper'

class UserFollowupsControllerTest < ActionController::TestCase
  setup do
    @user_followup = user_followups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_followups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_followup" do
    assert_difference('UserFollowup.count') do
      post :create, user_followup: @user_followup.attributes
    end

    assert_redirected_to user_followup_path(assigns(:user_followup))
  end

  test "should show user_followup" do
    get :show, id: @user_followup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_followup
    assert_response :success
  end

  test "should update user_followup" do
    put :update, id: @user_followup, user_followup: @user_followup.attributes
    assert_redirected_to user_followup_path(assigns(:user_followup))
  end

  test "should destroy user_followup" do
    assert_difference('UserFollowup.count', -1) do
      delete :destroy, id: @user_followup
    end

    assert_redirected_to user_followups_path
  end
end
