require 'test_helper'

class FriendsRewardsControllerTest < ActionController::TestCase
  setup do
    @friends_reward = friends_rewards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friends_rewards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friends_reward" do
    assert_difference('FriendsReward.count') do
      post :create, friends_reward: { address: @friends_reward.address, business_name: @friends_reward.business_name, friends_terms: @friends_reward.friends_terms, listing_link: @friends_reward.listing_link }
    end

    assert_redirected_to friends_reward_path(assigns(:friends_reward))
  end

  test "should show friends_reward" do
    get :show, id: @friends_reward
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friends_reward
    assert_response :success
  end

  test "should update friends_reward" do
    patch :update, id: @friends_reward, friends_reward: { address: @friends_reward.address, business_name: @friends_reward.business_name, friends_terms: @friends_reward.friends_terms, listing_link: @friends_reward.listing_link }
    assert_redirected_to friends_reward_path(assigns(:friends_reward))
  end

  test "should destroy friends_reward" do
    assert_difference('FriendsReward.count', -1) do
      delete :destroy, id: @friends_reward
    end

    assert_redirected_to friends_rewards_path
  end
end
