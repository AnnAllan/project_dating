# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170717195201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address",    null: false
    t.string   "secondary_address", null: false
    t.string   "city"
    t.string   "state_abbr"
    t.string   "zip",               null: false
    t.integer  "user_id",           null: false
    t.boolean  "billing_address"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "author"
    t.text     "message"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  end

  create_table "imports", force: :cascade do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "liker_id",   null: false
    t.integer  "liked_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liker_id", "liked_id"], name: "index_likes_on_liker_id_and_liked_id", unique: true, using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.string   "user_id",    default: "0"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "partner_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "user_name",       null: false
    t.string   "email",           null: false
    t.string   "phone",           null: false
    t.string   "credit_card",     null: false
    t.integer  "home_address"
    t.integer  "billing_address", null: false
    t.integer  "gender_identity", null: false
    t.integer  "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "users_questions_answers_imports", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "question_id", null: false
    t.integer  "answer_id",   null: false
    t.integer  "import_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["answer_id"], name: "index_users_questions_answers_imports_on_answer_id", using: :btree
    t.index ["import_id"], name: "index_users_questions_answers_imports_on_import_id", using: :btree
    t.index ["question_id"], name: "index_users_questions_answers_imports_on_question_id", using: :btree
    t.index ["user_id"], name: "index_users_questions_answers_imports_on_user_id", using: :btree
  end

end
