# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_14_095043) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "banners", force: :cascade do |t|
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "benefits", force: :cascade do |t|
    t.string "content", null: false
    t.string "remark"
    t.bigint "brand_partner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_partner_id"], name: "index_benefits_on_brand_partner_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.integer "views_count", default: 0
    t.integer "blog_status", default: 0
    t.boolean "delete_flg", default: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_blogs_on_category_id"
  end

  create_table "brand_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brand_partners", force: :cascade do |t|
    t.string "name"
    t.bigint "brand_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_category_id"], name: "index_brand_partners_on_brand_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "student_name"
    t.string "parent_name"
    t.string "email"
    t.string "phone_number"
    t.date "birth_date"
    t.string "gender"
    t.string "nationality"
    t.string "address"
    t.string "current_school"
    t.string "current_year_group"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.decimal "price"
    t.integer "discount_percentage"
    t.bigint "brand_partner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_partner_id"], name: "index_items_on_brand_partner_id"
  end

  create_table "kings_yangon_users", force: :cascade do |t|
    t.string "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "name"
    t.text "speech"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "current_year_group"
    t.integer "batch_year"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "department"
    t.string "title"
    t.string "position"
    t.integer "role", default: 0
    t.boolean "change_password", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "benefits", "brand_partners"
  add_foreign_key "blogs", "categories"
  add_foreign_key "brand_partners", "brand_categories"
  add_foreign_key "items", "brand_partners"
end
