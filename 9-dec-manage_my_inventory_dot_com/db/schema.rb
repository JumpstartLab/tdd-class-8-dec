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

ActiveRecord::Schema.define(:version => 20141210163636) do

  create_table "characteristic_types", :force => true do |t|
    t.string "name"
  end

  create_table "characteristics", :force => true do |t|
    t.integer "characteristic_type_id"
    t.string  "name"
  end

  create_table "item_to_characteristics", :force => true do |t|
    t.integer "item_id"
    t.integer "characteristic_id"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price",        :default => 0
    t.integer  "merchant_id",                 :null => false
    t.datetime "receive_date"
    t.datetime "sell_date"
    t.datetime "ship_date"
  end

  create_table "merchants", :force => true do |t|
    t.string  "name"
    t.integer "tier"
    t.string  "location"
  end

end
