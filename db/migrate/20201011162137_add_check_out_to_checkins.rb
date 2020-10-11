class AddCheckOutToCheckins < ActiveRecord::Migration[5.2]
  def change
    add_column :checkins, :checked_in, :boolean, default: false
  end
end
