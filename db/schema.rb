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

ActiveRecord::Schema.define(version: 20170816155810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_notes", force: :cascade do |t|
    t.text     "note"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_employee_notes_on_employee_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "phone"
    t.string   "company"
    t.string   "type"
    t.integer  "roster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roster_id"], name: "index_employees_on_roster_id", using: :btree
  end

  create_table "project_types", force: :cascade do |t|
    t.string   "project_type"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_id"], name: "index_project_types_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "company"
    t.string   "project_type"
    t.string   "client"
    t.string   "store_num"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "invoice_to"
    t.string   "project_manager"
    t.string   "status"
    t.string   "billing"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "duration"
    t.integer  "num_of_employees"
    t.integer  "num_of_shifts"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "site_manager"
  end

  create_table "roster_lists", force: :cascade do |t|
    t.integer  "roster_id"
    t.integer  "employee_id"
    t.string   "perdiem"
    t.string   "expense_code"
    t.integer  "shift_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["employee_id"], name: "index_roster_lists_on_employee_id", using: :btree
    t.index ["roster_id"], name: "index_roster_lists_on_roster_id", using: :btree
  end

  create_table "rosters", force: :cascade do |t|
    t.date     "week"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_rosters_on_project_id", using: :btree
  end

  create_table "shift_infos", force: :cascade do |t|
    t.integer  "shift_id"
    t.string   "shift_days"
    t.time     "shift_start_time"
    t.time     "shift_end_time"
    t.text     "notes"
    t.integer  "roster_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["roster_id"], name: "index_shift_infos_on_roster_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "state_name"
    t.string   "state_code"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_states_on_project_id", using: :btree
  end

  create_table "travel_infos", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "hotel_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_travel_infos_on_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "employee_notes", "employees"
  add_foreign_key "employees", "rosters"
  add_foreign_key "project_types", "projects"
  add_foreign_key "roster_lists", "employees"
  add_foreign_key "roster_lists", "rosters"
  add_foreign_key "rosters", "projects"
  add_foreign_key "shift_infos", "rosters"
  add_foreign_key "states", "projects"
  add_foreign_key "travel_infos", "projects"
end
