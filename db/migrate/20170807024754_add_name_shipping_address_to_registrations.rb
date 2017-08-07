class AddNameShippingAddressToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :name_person_2, :string
    add_column :registrations, :ic_person_2, :string
    add_column :registrations, :dob_person_2, :datetime
    add_column :registrations, :email_person_2, :string
  end
end
