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

ActiveRecord::Schema.define(version: 2023_05_09_154533) do

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "password_digest", limit: 60, null: false
    t.string "email", limit: 60, null: false
    t.string "cpf", limit: 14, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visits", force: :cascade do |t|
    t.date "data"
    t.integer "user_id", null: false
    t.datetime "checkin_at"
    t.datetime "checkout_at"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "visits", "users"
end
