class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.string :name
      t.string :room_type
      t.text :facilities
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
