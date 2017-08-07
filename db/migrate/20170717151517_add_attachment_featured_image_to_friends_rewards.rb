class AddAttachmentFeaturedImageToFriendsRewards < ActiveRecord::Migration
  def self.up
    change_table :friends_rewards do |t|
      t.attachment :featured_image
    end
  end

  def self.down
    remove_attachment :friends_rewards, :featured_image
  end
end
