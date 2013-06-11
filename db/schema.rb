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

ActiveRecord::Schema.define(version: 20130611051202) do

  create_table "assets", force: true do |t|
    t.string   "codneg"
    t.string   "nomres"
    t.integer  "quatot",     limit: 8
    t.integer  "voltot",     limit: 8
    t.decimal  "expret"
    t.decimal  "risk"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historical_quotations", force: true do |t|
    t.date     "cry_date"
    t.string   "codbdi"
    t.string   "codneg"
    t.integer  "tpmerc"
    t.string   "nomres"
    t.string   "especi"
    t.string   "prazot"
    t.string   "modref"
    t.integer  "preabe",      limit: 8
    t.integer  "premax",      limit: 8
    t.integer  "premin",      limit: 8
    t.integer  "premed",      limit: 8
    t.integer  "preult",      limit: 8
    t.integer  "preofc",      limit: 8
    t.integer  "preofv",      limit: 8
    t.integer  "totneg"
    t.integer  "quatot",      limit: 8
    t.integer  "voltot",      limit: 8
    t.integer  "preexe",      limit: 8
    t.integer  "indopc"
    t.date     "datven"
    t.integer  "fatcot"
    t.string   "ptoexe"
    t.string   "codisi"
    t.integer  "dismes"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "return_rate"
  end

  add_index "historical_quotations", ["asset_id"], name: "index_historical_quotations_on_asset_id", using: :btree

end
