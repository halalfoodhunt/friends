class AddRecurringColumnsToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :recurring, :boolean
    add_column :memberships, :period, :string
    add_column :memberships, :cycles, :integer
  end
end
