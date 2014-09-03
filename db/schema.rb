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

ActiveRecord::Schema.define(version: 20140903072808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: true do |t|
    t.integer  "likes"
    t.integer  "user_likes_id"
    t.integer  "shoutout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nokogirigas", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoutouts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "code"
    t.integer  "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

end
