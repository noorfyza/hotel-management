class AddStatusToRooms < ActiveRecord::Migration[5.2]
  def self.up
    add_column :rooms, :availability, :boolean, :default => true
  end

  def self.down
    remove_column :rooms, :availability
  end
end
