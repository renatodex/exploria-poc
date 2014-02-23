require 'test_helper'

class MonsterInstancesControllerTest < ActionController::TestCase
  setup do
    @monster_instance = monster_instances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monster_instances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monster_instance" do
    assert_difference('MonsterInstance.count') do
      post :create, monster_instance: { hp: @monster_instance.hp, monster_id: @monster_instance.monster_id }
    end

    assert_redirected_to monster_instance_path(assigns(:monster_instance))
  end

  test "should show monster_instance" do
    get :show, id: @monster_instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monster_instance
    assert_response :success
  end

  test "should update monster_instance" do
    patch :update, id: @monster_instance, monster_instance: { hp: @monster_instance.hp, monster_id: @monster_instance.monster_id }
    assert_redirected_to monster_instance_path(assigns(:monster_instance))
  end

  test "should destroy monster_instance" do
    assert_difference('MonsterInstance.count', -1) do
      delete :destroy, id: @monster_instance
    end

    assert_redirected_to monster_instances_path
  end
end
