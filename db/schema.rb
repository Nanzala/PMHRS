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

ActiveRecord::Schema.define(version: 20151126122732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "admins", force: :cascade do |t|
    t.string   "name",                                null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "hospitals", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "level"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ref",        null: false
  end

  add_index "hospitals", ["ref"], name: "index_hospitals_on_ref", using: :btree

  create_table "med_tests", force: :cascade do |t|
    t.string   "record_id"
    t.string   "test"
    t.string   "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string   "record_id"
    t.string   "medication"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "phone"
    t.string   "email"
    t.string   "next_of_kin"
    t.string   "next_of_kin_contact"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "encrypted_ssn",       null: false
  end

  add_index "patients", ["encrypted_ssn"], name: "index_patients_on_encrypted_ssn", using: :btree

  create_table "records", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "hospital_id",    null: false
    t.string   "staff_id",       null: false
    t.integer  "height"
    t.integer  "weight"
    t.integer  "temperature"
    t.string   "blood_pressure"
    t.string   "symptoms"
    t.string   "diagnosis"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.uuid     "patient_id"
  end

  add_index "records", ["patient_id"], name: "index_records_on_patient_id", using: :btree

  create_table "staffs", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_ssn",                       null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "staffs", ["email"], name: "index_staffs_on_email", unique: true, using: :btree
  add_index "staffs", ["encrypted_ssn"], name: "index_staffs_on_encrypted_ssn", using: :btree
  add_index "staffs", ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true, using: :btree
  add_index "staffs", ["unlock_token"], name: "index_staffs_on_unlock_token", unique: true, using: :btree

  add_foreign_key "records", "patients"
end
