require 'test_helper'

class SceneActionsControllerTest < ActionController::TestCase
  setup do
    @scene_action = scene_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scene_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene_action" do
    assert_difference('SceneAction.count') do
      post :create, scene_action: { name: @scene_action.name, scene_callback_id: @scene_action.scene_callback_id, scene_id: @scene_action.scene_id }
    end

    assert_redirected_to scene_action_path(assigns(:scene_action))
  end

  test "should show scene_action" do
    get :show, id: @scene_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene_action
    assert_response :success
  end

  test "should update scene_action" do
    patch :update, id: @scene_action, scene_action: { name: @scene_action.name, scene_callback_id: @scene_action.scene_callback_id, scene_id: @scene_action.scene_id }
    assert_redirected_to scene_action_path(assigns(:scene_action))
  end

  test "should destroy scene_action" do
    assert_difference('SceneAction.count', -1) do
      delete :destroy, id: @scene_action
    end

    assert_redirected_to scene_actions_path
  end
end
