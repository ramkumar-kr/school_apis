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

ActiveRecord::Schema.define(version: 20150830063909) do

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.decimal "rating",    default: 0.0, null: false
    t.integer "review_id"
  end

  add_index "categories", ["review_id"], name: "index_categories_on_review_id"

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating",    default: 5,  null: false
    t.string  "comment",   default: ""
    t.integer "user_id"
    t.integer "school_id"
  end

  add_index "reviews", ["school_id"], name: "index_reviews_on_school_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "schools", force: :cascade do |t|
    t.string  "name"
    t.string  "email",                      default: "",                null: false
    t.string  "website",                    default: "www.example.com", null: false
    t.string  "address",                    default: "",                null: false
    t.decimal "phone",       precision: 10, default: 0,                 null: false
    t.integer "location_id"
    t.string  "image_url"
    t.string  "schools"
    t.string  "description"
  end

  add_index "schools", ["location_id"], name: "index_schools_on_location_id"

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email",                             default: "", null: false
    t.string  "encrypted_password",                default: "", null: false
    t.decimal "phone",              precision: 10, default: 0,  null: false
  end

end
