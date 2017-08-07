class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
