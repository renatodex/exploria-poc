require 'test_helper'

class MerchantControllerTest < ActionController::TestCase
  test "should get store" do
    get :store
    assert_response :success
  end

  test "should get buy_items" do
    get :buy_items
    assert_response :success
  end

  test "should get buy_transaction" do
    get :buy_transaction
    assert_response :success
  end

end
