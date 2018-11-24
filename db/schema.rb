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

ActiveRecord::Schema.define(version: 2018_11_24_012434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "infos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "spiritual_name"
    t.string "image_url"
    t.string "webpage"
    t.text "introduction"
    t.string "phone"
    t.boolean "public_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_infos_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "address"
    t.string "studio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "duration"
    t.datetime "start"
    t.datetime "end"
    t.integer "class_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "yoga_class_id"
    t.index ["yoga_class_id"], name: "index_schedules_on_yoga_class_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_teacher", default: false
    t.datetime "last_login"
  end

  create_table "yoga_classes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "location_id"
    t.index ["location_id"], name: "index_yoga_classes_on_location_id"
    t.index ["user_id"], name: "index_yoga_classes_on_user_id"
  end

  add_foreign_key "infos", "users"
  add_foreign_key "schedules", "yoga_classes"
  add_foreign_key "yoga_classes", "locations"
  add_foreign_key "yoga_classes", "users"
end
