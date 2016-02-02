class AddProfileAndLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :profile, :string
  end
end
