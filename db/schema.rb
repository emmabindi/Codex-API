# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_25_044929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "language_id", null: false
    t.index ["category_id"], name: "index_bookmarks_on_category_id"
    t.index ["language_id"], name: "index_bookmarks_on_language_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.date "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "completed", default: false, null: false
    t.bigint "user_id", null: false
    t.date "completed_date"
    t.bigint "category_id", null: false
    t.bigint "language_id", null: false
    t.index ["category_id"], name: "index_goals_on_category_id"
    t.index ["language_id"], name: "index_goals_on_language_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "journals", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "language_id", null: false
    t.index ["category_id"], name: "index_journals_on_category_id"
    t.index ["language_id"], name: "index_journals_on_language_id"
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookmarks", "categories"
  add_foreign_key "bookmarks", "languages"
  add_foreign_key "bookmarks", "users", on_delete: :cascade
  add_foreign_key "goals", "categories"
  add_foreign_key "goals", "languages"
  add_foreign_key "goals", "users", on_delete: :cascade
  add_foreign_key "journals", "categories"
  add_foreign_key "journals", "languages"
  add_foreign_key "journals", "users", on_delete: :cascade
end
