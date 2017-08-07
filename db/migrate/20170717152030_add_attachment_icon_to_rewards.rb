class AddAttachmentIconToRewards < ActiveRecord::Migration
  def self.up
    change_table :rewards do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :rewards, :icon
  end
end
