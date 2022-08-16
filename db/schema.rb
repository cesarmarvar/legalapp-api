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

ActiveRecord::Schema[7.0].define(version: 2022_08_16_204009) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lawyer_specialities", force: :cascade do |t|
    t.bigint "lawyer_id", null: false
    t.bigint "speciality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawyer_id"], name: "index_lawyer_specialities_on_lawyer_id"
    t.index ["speciality_id"], name: "index_lawyer_specialities_on_speciality_id"
  end

  create_table "lawyers", force: :cascade do |t|
    t.string "name"
    t.integer "years_licensed"
    t.text "bio"
    t.string "credentials"
    t.string "payment_method"
    t.string "social_media"
    t.string "state_location"
    t.string "office_address"
    t.integer "office_phone"
    t.integer "cellphone"
    t.string "email"
    t.integer "lat"
    t.integer "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.text "explanation"
    t.bigint "user_id", null: false
    t.bigint "lawyer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawyer_id"], name: "index_questions_on_lawyer_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "title"
    t.text "content"
    t.integer "context"
    t.string "name"
    t.string "email"
    t.bigint "lawyer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lawyer_id"], name: "index_reviews_on_lawyer_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "speciality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lawyer_specialities", "lawyers"
  add_foreign_key "lawyer_specialities", "specialities"
  add_foreign_key "questions", "lawyers"
  add_foreign_key "questions", "users"
  add_foreign_key "reviews", "lawyers"
  add_foreign_key "reviews", "users"
end
