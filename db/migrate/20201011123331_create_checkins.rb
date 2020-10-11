class CreateCheckins < ActiveRecord::Migration[5.2]
  def change
    create_table :checkins do |t|
      t.datetime :checkindate
      t.datetime :checkoutdate
      t.references :room, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :amount_to_be_paid

      t.timestamps
    end
  end
end
