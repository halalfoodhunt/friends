class CreateFriendsCards < ActiveRecord::Migration
  def change
    create_table :friends_cards do |t|
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
