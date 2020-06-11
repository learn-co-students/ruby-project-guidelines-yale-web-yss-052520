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

ActiveRecord::Schema.define(version: 2020_06_08_222314) do

  create_table "boards", force: :cascade do |t|
    t.string "content", default: "⬜🔵⬜⬛⬜🔴⬜🔴\n🔵⬜🔵⬜⬛⬜🔴⬜\n⬜🔵⬜⬛⬜🔴⬜🔴\n🔵⬜🔵⬜⬛⬜🔴⬜\n⬜🔵⬜⬛⬜🔴⬜🔴\n🔵⬜🔵⬜⬛⬜🔴⬜\n⬜🔵⬜⬛⬜🔴⬜🔴\n🔵⬜🔵⬜⬛⬜🔴⬜"
    t.integer "l_player_id"
    t.integer "r_player_id"
    t.string "player_turn", default: "l"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "win_count", default: 0
  end

end
