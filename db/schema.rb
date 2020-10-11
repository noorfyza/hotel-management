# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_11_162137) do

  create_table "checkins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "checkindate"
    t.datetime "checkoutdate"
    t.bigint "room_id"
    t.bigint "customer_id"
    t.integer "amount_to_be_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked_in", default: false
    t.index ["customer_id"], name: "index_checkins_on_customer_id"
    t.index ["room_id"], name: "index_checkins_on_room_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "sex"
    t.text "address"
    t.integer "mobile"
    t.string "email"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "room_no"
    t.string "name"
    t.string "room_type"
    t.text "facilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "availability", default: true
    t.integer "price"
  end

  add_foreign_key "checkins", "customers"
  add_foreign_key "checkins", "rooms"
end
