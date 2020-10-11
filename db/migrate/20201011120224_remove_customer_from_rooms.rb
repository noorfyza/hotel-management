class RemoveCustomerFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rooms, :customer, foreign_key: true
  end
end
