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

ActiveRecord::Schema.define(version: 20131127183835) do

  create_table "handbag_purses", force: true do |t|
    t.string   "purseholder_type"
    t.integer  "purseholder_id"
    t.string   "token",                            null: false
    t.datetime "token_expires_at",                 null: false
    t.boolean  "locked",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "handbag_purses", ["purseholder_id"], name: "index_handbag_purses_on_purseholder_id"
  add_index "handbag_purses", ["purseholder_type", "purseholder_id"], name: "index_handbag_purses_on_purseholder_type_and_purseholder_id", unique: true
  add_index "handbag_purses", ["purseholder_type"], name: "index_handbag_purses_on_purseholder_type"
  add_index "handbag_purses", ["token"], name: "index_handbag_purses_on_token", unique: true

end
