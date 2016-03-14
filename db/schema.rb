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

ActiveRecord::Schema.define(version: 20160314084709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_makes", force: :cascade do |t|
    t.string "mark"
  end

  create_table "car_models", force: :cascade do |t|
    t.integer  "mark_id"
    t.string   "model"
    t.datetime "created_at", default: '2016-03-10 08:37:39', null: false
    t.datetime "updated_at", default: '2016-03-10 08:37:39', null: false
  end

  add_index "car_models", ["mark_id"], name: "index_car_models_on_mark_id", using: :btree

  create_table "cars", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "make"
    t.string   "model"
    t.string   "manufacture_year"
    t.string   "color"
    t.string   "plate"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "cars", ["user_id"], name: "index_cars_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "full_address"
    t.string   "country"
    t.string   "city"
    t.string   "address1"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",   default: -> { "now()" }, null: false
    t.datetime "updated_at",   default: -> { "now()" }, null: false
  end

  create_table "make_models", force: :cascade do |t|
    t.integer "car_make_id"
    t.string  "model"
  end

  add_index "make_models", ["car_make_id"], name: "index_make_models_on_car_make_id", using: :btree

  create_table "marks", force: :cascade do |t|
    t.string   "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options_orders", id: false, force: :cascade do |t|
    t.integer "option_id"
    t.integer "order_id"
  end

  add_index "options_orders", ["option_id"], name: "index_options_orders_on_option_id", using: :btree
  add_index "options_orders", ["order_id"], name: "index_options_orders_on_order_id", using: :btree

  create_table "order_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "from_location_id"
    t.integer  "to_location_id"
    t.integer  "order_state_id"
    t.decimal  "cost"
    t.string   "comment"
    t.string   "author"
    t.integer  "score"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "orders", ["from_location_id"], name: "index_orders_on_from_location_id", using: :btree
  add_index "orders", ["order_state_id"], name: "index_orders_on_order_state_id", using: :btree
  add_index "orders", ["to_location_id"], name: "index_orders_on_to_location_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.boolean  "completed"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "phone"
    t.integer  "user_state_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "picture"
    t.string   "city"
    t.boolean  "have_car"
    t.string   "code_token"
    t.datetime "created_at",    default: -> { "now()" }, null: false
    t.datetime "updated_at",    default: -> { "now()" }, null: false
  end

  add_index "users", ["user_state_id"], name: "index_users_on_user_state_id", using: :btree

  add_foreign_key "car_models", "marks"
  add_foreign_key "cars", "users"
  add_foreign_key "make_models", "car_makes"
  add_foreign_key "orders", "order_states"
  add_foreign_key "orders", "users"
  add_foreign_key "users", "user_states"
end
