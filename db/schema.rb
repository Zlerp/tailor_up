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

ActiveRecord::Schema.define(version: 20150808200437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "stages"
    t.string   "address"
    t.datetime "appointment_time"
    t.datetime "due_time"
    t.string   "service"
    t.string   "pickup_location"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.string   "zip"
    t.integer  "tailor_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "kind"
    t.integer  "quantity"
    t.string   "other"
    t.integer  "appointment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "articles", ["appointment_id"], name: "index_articles_on_appointment_id", using: :btree

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "tailor_id"
    t.integer  "user_id"
    t.boolean  "booked"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "requested"
    t.integer  "appointment_id"
  end

  add_index "availabilities", ["appointment_id"], name: "index_availabilities_on_appointment_id", using: :btree
  add_index "availabilities", ["tailor_id"], name: "index_availabilities_on_tailor_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tailors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.string   "avatar"
    t.string   "location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "company_id"
    t.string   "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "avatar"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "zip"
    t.string   "image"
  end

  add_foreign_key "articles", "appointments"
  add_foreign_key "availabilities", "appointments"
  add_foreign_key "availabilities", "tailors"
end
