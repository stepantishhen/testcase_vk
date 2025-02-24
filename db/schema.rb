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

ActiveRecord::Schema[8.0].define(version: 2024_03_19_000003) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "school_classes", force: :cascade do |t|
    t.integer "number"
    t.string "letter"
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "surname"
    t.string "auth_token"
    t.bigint "school_id", null: false
    t.bigint "class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_students_on_auth_token", unique: true
    t.index ["class_id"], name: "index_students_on_class_id"
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  add_foreign_key "school_classes", "schools"
  add_foreign_key "students", "school_classes", column: "class_id"
  add_foreign_key "students", "schools"
end
