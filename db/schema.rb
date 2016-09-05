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

ActiveRecord::Schema.define(version: 20160905202750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_categories", force: :cascade do |t|
    t.integer "app_id"
    t.integer "category_id"
  end

  add_index "app_categories", ["app_id", "category_id"], name: "index_app_categories_on_app_id_and_category_id", using: :btree
  add_index "app_categories", ["app_id"], name: "index_app_categories_on_app_id", using: :btree
  add_index "app_categories", ["category_id"], name: "index_app_categories_on_category_id", using: :btree

  create_table "apps", force: :cascade do |t|
    t.string  "name"
    t.string  "link"
    t.string  "image_url"
    t.text    "description"
    t.decimal "rating",      precision: 6, scale: 2
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string  "user_name"
    t.text    "message"
    t.integer "app_id"
  end

  add_index "reviews", ["app_id"], name: "index_reviews_on_app_id", using: :btree

end
