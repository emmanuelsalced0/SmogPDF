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

ActiveRecord::Schema.define(version: 20170217204634) do

  create_table "posts", force: :cascade do |t|
    t.string   "Name"
    t.string   "Phone"
    t.string   "Adress"
    t.string   "Veh_Year"
    t.string   "Make"
    t.string   "Model"
    t.string   "LicPlate"
    t.string   "Miles"
    t.string   "VIN"
    t.string   "Visa"
    t.string   "MasterCard"
    t.string   "Discover"
    t.string   "Cash"
    t.string   "Pair"
    t.string   "Air"
    t.string   "Acl"
    t.string   "Tc_cac"
    t.string   "Efe"
    t.string   "Egr"
    t.string   "Can"
    t.string   "Cat"
    t.string   "Mil"
    t.string   "O2s"
    t.string   "Pcv"
    t.string   "Timing"
    t.string   "CASmog",     default: "0"
    t.string   "CAInsp",     default: "0"
    t.string   "VIN2",       default: "0"
    t.string   "CASmogCert", default: "0"
    t.string   "PreInsp",    default: "0"
    t.string   "ReInsp",     default: "0"
    t.string   "EngCover",   default: "0"
    t.string   "Other",      default: "0"
    t.string   "Evap",       default: "0"
    t.string   "Est",        default: "0"
    t.string   "GasCap",     default: "0"
    t.string   "Mis",        default: "0"
    t.string   "Tax",        default: "0.0975"
    t.float    "TotalWtax"
    t.float    "Total"
    t.float    "Clientnum"
    t.datetime "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
