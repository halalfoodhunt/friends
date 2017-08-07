class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :ic_number
      t.datetime :date_of_birth
      t.string :contact_number
      t.string :email
      t.string :instagram_account
      t.boolean :facebook_ads
      t.boolean :facebook_newsfeed
      t.boolean :facebook_video
      t.boolean :instagram

      t.timestamps null: false
    end
  end
end
