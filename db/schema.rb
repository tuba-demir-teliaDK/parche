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

ActiveRecord::Schema.define(:version => 20120224163352) do

  create_table "books", :force => true do |t|
    t.string   "name"
    t.integer  "page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkins", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "venue_product_id"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "checkin_count"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.integer  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "phone"
    t.string   "city"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_products", :force => true do |t|
    t.string   "venue_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
