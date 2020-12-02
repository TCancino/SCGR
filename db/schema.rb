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

ActiveRecord::Schema.define(version: 2020_12_01_230801) do

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "document_postulations", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "postulation_id", null: false
  end

  create_table "post_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "requirements"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "post_state_id", null: false
    t.integer "vacancies"
    t.index ["post_state_id"], name: "index_posts_on_post_state_id"
  end

  create_table "postulation_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "postulations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "post_id", null: false
    t.integer "postulation_state_id", null: false
    t.integer "user_id", null: false
    t.index ["post_id"], name: "index_postulations_on_post_id"
    t.index ["postulation_state_id"], name: "index_postulations_on_postulation_state_id"
    t.index ["user_id"], name: "index_postulations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "rut"
    t.string "dv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "state"
    t.integer "role", default: 0 #0-> Admin, 1-> Consultor, 2->Cliente, 3->Postulante
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "documents", "users"
  add_foreign_key "posts", "post_states"
  add_foreign_key "postulations", "posts"
  add_foreign_key "postulations", "postulation_states"
  add_foreign_key "postulations", "users"
end
