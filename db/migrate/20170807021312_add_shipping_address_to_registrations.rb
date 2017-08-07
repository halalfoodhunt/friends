class AddShippingAddressToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :shipping_address, :string
  end
end
