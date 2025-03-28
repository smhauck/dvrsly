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

ActiveRecord::Schema[8.0].define(version: 2025_03_28_082529) do
  create_table "ban_reasons", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.boolean "is_deleted", default: false, null: false
    t.boolean "is_moderated", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "moderated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.boolean "is_deleted", default: false, null: false
    t.boolean "is_moderated", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "moderated_at"
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.integer "parent_comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_comment_id"], name: "index_comments_on_parent_comment_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "diversions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diversions_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "moderated_at"
    t.boolean "is_moderated", default: false, null: false
    t.integer "user_id", null: false
    t.integer "diversion_id"
    t.integer "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_id"], name: "index_posts_on_blog_id"
    t.index ["diversion_id"], name: "index_posts_on_diversion_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.text "about"
    t.boolean "banned", default: false, null: false
    t.datetime "banned_datetime"
    t.integer "banned_by_id"
    t.integer "ban_reasons_id"
    t.text "banned_comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ban_reasons_id"], name: "index_users_on_ban_reasons_id"
    t.index ["banned_by_id"], name: "index_users_on_banned_by_id"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "blogs", "users"
  add_foreign_key "comments", "comments", column: "parent_comment_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "diversions", "users"
  add_foreign_key "posts", "blogs"
  add_foreign_key "posts", "diversions"
  add_foreign_key "posts", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "users", "users", column: "banned_by_id"
end
