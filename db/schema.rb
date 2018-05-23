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

ActiveRecord::Schema.define(version: 20180513113519) do

  create_table "branches", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id"

# Could not dump table "companies" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "costbases", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "model"
    t.string   "category"
    t.integer  "oil_filter"
    t.integer  "fuel_filter"
    t.integer  "ps_oil"
    t.integer  "tm_oil"
    t.integer  "df_oil"
    t.integer  "air_filter"
    t.integer  "air_drier"
    t.integer  "break_oil"
    t.integer  "clutch_oil"
    t.integer  "coolant"
    t.integer  "grease"
    t.integer  "cng_filter"
    t.integer  "spark_plug"
    t.integer  "clutch_kit"
    t.integer  "battery"
    t.integer  "filter_ps_oil"
    t.integer  "timing_belt_eg"
    t.integer  "timing_belt_ac"
    t.integer  "filter_axle"
    t.integer  "softwasher"
    t.integer  "gasket_front_wheel"
    t.integer  "gasket_rear_wheel"
    t.integer  "seal_oil_front_wheel"
    t.integer  "wheel_grease"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "type"
    t.integer  "seal_oil_rear_wheel"
  end

  add_index "costbases", ["company_id"], name: "index_costbases_on_company_id"

  create_table "dealerbranches", force: :cascade do |t|
    t.integer  "dealercompany_id"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "dealerbranches", ["dealercompany_id"], name: "index_dealerbranches_on_dealercompany_id"

  create_table "dealercompanies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dealerusers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "position"
    t.integer  "branch_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "password_digest"
    t.integer  "dealercompany_id"
    t.integer  "dealerbranch_id"
  end

  add_index "dealerusers", ["branch_id"], name: "index_dealerusers_on_branch_id"
  add_index "dealerusers", ["dealerbranch_id"], name: "index_dealerusers_on_dealerbranch_id"
  add_index "dealerusers", ["dealercompany_id"], name: "index_dealerusers_on_dealercompany_id"

  create_table "loginotes", force: :cascade do |t|
    t.integer  "truck_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "loginotes", ["truck_id", "created_at"], name: "index_loginotes_on_truck_id_and_created_at"
  add_index "loginotes", ["truck_id"], name: "index_loginotes_on_truck_id"

  create_table "maintains", force: :cascade do |t|
    t.integer  "truck_id"
    t.date     "action"
    t.integer  "mileage"
    t.integer  "nextmileage"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "maintains", ["truck_id"], name: "index_maintains_on_truck_id"

  create_table "oilprices", force: :cascade do |t|
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tirehistories", force: :cascade do |t|
    t.integer  "truck_id"
    t.integer  "index"
    t.string   "serialno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tirehistories", ["truck_id"], name: "index_tirehistories_on_truck_id"

  create_table "truckhistories", force: :cascade do |t|
    t.integer  "truck_id"
    t.date     "action"
    t.integer  "mileage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "truckhistories", ["truck_id"], name: "index_truckhistories_on_truck_id"

  create_table "truckrelationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "truckrelationships", ["truck_id"], name: "index_truckrelationships_on_truck_id"
  add_index "truckrelationships", ["user_id"], name: "index_truckrelationships_on_user_id"

  create_table "trucks", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "branch_id"
    t.string   "maker"
    t.string   "model"
    t.string   "body"
    t.integer  "wheels"
    t.string   "engine"
    t.string   "vehicleid"
    t.string   "number"
    t.integer  "e_oil"
    t.integer  "tm_oil"
    t.string   "tire"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "df_oil"
    t.integer  "initmileage"
    t.date     "purchase"
    t.string   "image"
  end

  add_index "trucks", ["branch_id"], name: "index_trucks_on_branch_id"
  add_index "trucks", ["company_id"], name: "index_trucks_on_company_id"

  create_table "users", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.boolean  "authorizer"
    t.integer  "branch_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

  add_index "users", ["branch_id"], name: "index_users_on_branch_id"
  add_index "users", ["company_id"], name: "index_users_on_company_id"

  create_table "vehicle_karte_histories", force: :cascade do |t|
    t.string   "vehicle_id"
    t.string   "vehicle_No"
    t.string   "integer"
    t.string   "history"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_kartes", force: :cascade do |t|
    t.string   "history"
    t.string   "vehicle_id"
    t.string   "vehicle_No"
    t.string   "integer"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
