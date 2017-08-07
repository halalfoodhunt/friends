class AddMembershipToRegistrations < ActiveRecord::Migration
  def change
    add_reference :registrations, :membership, index: true, foreign_key: true
  end
end
