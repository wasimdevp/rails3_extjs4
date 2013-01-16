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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130116084627) do

  create_table "dimensions", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "drivers", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "drivers", ["name"], :name => "index_drivers_on_name", :unique => true

  create_table "drivers_gundams", :force => true do |t|
    t.integer  "driver_id"
    t.integer  "gundam_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gundams", :force => true do |t|
    t.string   "name"
    t.string   "name_chs"
    t.string   "model"
    t.string   "type_id"
    t.string   "force"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "period_id"
  end

  add_index "gundams", ["model", "period_id"], :name => "index_gundams_on_model_and_period_id", :unique => true

  create_table "periods", :force => true do |t|
    t.string   "name"
    t.string   "year"
    t.string   "summary"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "dimension_id"
  end

  add_index "periods", ["year"], :name => "index_periods_on_year_and_series", :unique => true

  create_table "usages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "usages", ["name"], :name => "index_types_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
