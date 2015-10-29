# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151029021609) do

  create_table "cars", force: :cascade do |t|
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "train_id"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.string   "type"
    t.integer  "serial_number"
  end

  add_index "cars", ["id", "type"], name: "index_cars_on_id_and_type"
  add_index "cars", ["train_id"], name: "index_cars_on_train_id"

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "route_stations", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "route_id"
    t.integer  "position"
    t.datetime "departure_time"
    t.datetime "arrival_time"
  end

  add_index "route_stations", ["railway_station_id"], name: "index_route_stations_on_railway_station_id"
  add_index "route_stations", ["route_id", "position"], name: "index_route_stations_on_route_id_and_position"
  add_index "route_stations", ["route_id"], name: "index_route_stations_on_route_id"

  create_table "routes", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "train_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.string   "passport_series"
    t.string   "passport_number"
  end

  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "route_id"
    t.boolean  "cars_order"
  end

  add_index "trains", ["route_id"], name: "index_trains_on_route_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
