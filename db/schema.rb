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

ActiveRecord::Schema.define(version: 2024_03_25_230129) do

  create_table "groups", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "line_ups", charset: "utf8mb3", force: :cascade do |t|
    t.string "position"
    t.bigint "player_id"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_line_ups_on_player_id"
    t.index ["team_id"], name: "index_line_ups_on_team_id"
  end

  create_table "modalities", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "players"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.integer "rating"
    t.string "status"
    t.bigint "user_id"
    t.bigint "team_id"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_players_on_group_id"
    t.index ["team_id"], name: "index_players_on_team_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "teams", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_teams_on_group_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "role"
    t.string "status"
    t.date "birthdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "groups", "users"
  add_foreign_key "line_ups", "players"
  add_foreign_key "line_ups", "teams"
  add_foreign_key "players", "groups"
  add_foreign_key "players", "teams"
  add_foreign_key "players", "users"
  add_foreign_key "teams", "groups"
  add_foreign_key "teams", "users"
end
