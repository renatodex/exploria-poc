require 'test_helper'

class SceneNodesControllerTest < ActionController::TestCase
  setup do
    @scene_node = scene_nodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scene_nodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scene_node" do
    assert_difference('SceneNode.count') do
      post :create, scene_node: { neighbor_scene_id: @scene_node.neighbor_scene_id, scene_id: @scene_node.scene_id }
    end

    assert_redirected_to scene_node_path(assigns(:scene_node))
  end

  test "should show scene_node" do
    get :show, id: @scene_node
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scene_node
    assert_response :success
  end

  test "should update scene_node" do
    patch :update, id: @scene_node, scene_node: { neighbor_scene_id: @scene_node.neighbor_scene_id, scene_id: @scene_node.scene_id }
    assert_redirected_to scene_node_path(assigns(:scene_node))
  end

  test "should destroy scene_node" do
    assert_difference('SceneNode.count', -1) do
      delete :destroy, id: @scene_node
    end

    assert_redirected_to scene_nodes_path
  end
end
