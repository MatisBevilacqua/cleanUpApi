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

ActiveRecord::Schema[7.0].define(version: 2023_02_06_140255) do
  create_table "chats", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "id_send"
    t.string "id_receive"
    t.string "message"
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "content"
    t.string "send"
    t.integer "profile_id"
    t.integer "ranking"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "token"
    t.string "role"
    t.float "average_ranking"
    t.integer "comment_count"
    t.float "total_ranking"
  end

end
