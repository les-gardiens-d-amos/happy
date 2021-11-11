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

ActiveRecord::Schema.define(version: 2021_11_10_122202) do

  create_table "amos", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "user_id"
    t.integer "animal_id"
    t.string "species"
    t.string "amos_type"
    t.string "name"
    t.integer "level", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_path"
  end

  create_table "catches", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.decimal "long", precision: 11, scale: 7
    t.decimal "lat", precision: 11, scale: 7
    t.decimal "altitude", precision: 11, scale: 7
    t.decimal "accuracy", precision: 11, scale: 7
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "amos_id"
  end

  create_table "failed_jobs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "error"
    t.string "stack_trace"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: { type: :string, limit: 36 }, force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.boolean "is_admin", default: false
    t.datetime "connected_at", default: "2021-11-10 22:25:50"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
