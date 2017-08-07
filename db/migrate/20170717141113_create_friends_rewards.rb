class CreateFriendsRewards < ActiveRecord::Migration
  def change
    create_table :friends_rewards do |t|
      t.string :business_name
      t.string :listing_link
      t.text :address
      t.text :friends_terms

      t.timestamps null: false
    end
  end
end
