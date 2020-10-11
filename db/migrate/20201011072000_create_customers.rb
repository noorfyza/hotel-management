class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :sex
      t.text :address
      t.integer :mobile
      t.string :email
      t.date :birthdate

      t.timestamps
    end
  end
end
