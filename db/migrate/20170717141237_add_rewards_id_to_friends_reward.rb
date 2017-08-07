class AddRewardsIdToFriendsReward < ActiveRecord::Migration
  def change
    add_column :friends_rewards, :reward_id, :integer
  end
end
