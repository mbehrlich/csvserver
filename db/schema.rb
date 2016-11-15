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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.text     "name"
    t.text     "venue"
    t.datetime "created_at"
  end

  add_index "companies", ["created_at"], name: "companies_created_at_index", using: :btree
  add_index "companies", ["name"], name: "companies_name_key", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.text     "email"
    t.boolean  "opt_in"
    t.datetime "created_at"
    t.integer  "company_id"
  end

  add_index "users", ["created_at"], name: "users_created_at_index", using: :btree
  add_index "users", ["email"], name: "users_email_key", unique: true, using: :btree

  add_foreign_key "users", "companies", name: "users_company_id_fkey", on_delete: :cascade
end
