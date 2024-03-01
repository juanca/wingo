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

ActiveRecord::Schema[7.1].define(version: 2024_02_29_232113) do
  create_table "card_tiles", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "tile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "marked"
    t.index ["card_id"], name: "index_card_tiles_on_card_id"
    t.index ["tile_id"], name: "index_card_tiles_on_tile_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "lobby_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lobby_id"], name: "index_cards_on_lobby_id"
  end

  create_table "lobbies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiles", force: :cascade do |t|
    t.integer "lobby_id", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lobby_id"], name: "index_tiles_on_lobby_id"
  end

  add_foreign_key "card_tiles", "cards"
  add_foreign_key "card_tiles", "tiles"
  add_foreign_key "cards", "lobbies"
  add_foreign_key "tiles", "lobbies"
end
