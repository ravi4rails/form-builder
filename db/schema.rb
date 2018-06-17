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

ActiveRecord::Schema.define(version: 20180617183322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basic_forms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "block_fields", force: :cascade do |t|
    t.string "taggable_type"
    t.string "taggable_id"
    t.string "name"
    t.boolean "is_required"
    t.string "default_value"
    t.string "field_type"
    t.string "image"
    t.string "video"
    t.string "label"
    t.string "helptext"
    t.integer "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_block_fields_on_block_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.string "order"
    t.integer "custom_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_form_id"], name: "index_blocks_on_custom_form_id"
  end

  create_table "checkbox_options", force: :cascade do |t|
    t.string "option"
    t.integer "checkbox_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checkbox_question_id"], name: "index_checkbox_options_on_checkbox_question_id"
  end

  create_table "checkbox_questions", force: :cascade do |t|
    t.string "question"
    t.integer "feedback_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_required"
    t.index ["feedback_form_id"], name: "index_checkbox_questions_on_feedback_form_id"
  end

  create_table "custom_forms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dropdown_options", force: :cascade do |t|
    t.string "option"
    t.integer "dropdown_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dropdown_id"], name: "index_dropdown_options_on_dropdown_id"
  end

  create_table "dropdowns", force: :cascade do |t|
    t.string "title"
    t.integer "feedback_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedback_form_id"], name: "index_dropdowns_on_feedback_form_id"
  end

  create_table "feedback_forms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_blocks", force: :cascade do |t|
    t.string "label"
    t.string "field_type"
    t.boolean "is_required"
    t.integer "basic_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basic_form_id"], name: "index_form_blocks_on_basic_form_id"
  end

  create_table "form_fields", force: :cascade do |t|
    t.string "label"
    t.string "tag"
    t.boolean "is_required"
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_fields_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mcq_options", force: :cascade do |t|
    t.string "option"
    t.integer "multiple_choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multiple_choice_id"], name: "index_mcq_options_on_multiple_choice_id"
  end

  create_table "multiple_choices", force: :cascade do |t|
    t.string "question"
    t.integer "feedback_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_required"
    t.bigint "basic_form_id"
    t.index ["basic_form_id"], name: "index_multiple_choices_on_basic_form_id"
    t.index ["feedback_form_id"], name: "index_multiple_choices_on_feedback_form_id"
  end

  create_table "paragraph_questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.integer "feedback_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_required"
    t.index ["feedback_form_id"], name: "index_paragraph_questions_on_feedback_form_id"
  end

  create_table "short_questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.integer "feedback_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_required"
    t.index ["feedback_form_id"], name: "index_short_questions_on_feedback_form_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "basic_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "form_values", default: "{}", null: false
    t.index ["basic_form_id"], name: "index_submissions_on_basic_form_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "user_field_values", force: :cascade do |t|
    t.string "value"
    t.integer "user_id"
    t.integer "form_block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_block_id"], name: "index_user_field_values_on_form_block_id"
    t.index ["user_id"], name: "index_user_field_values_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "multiple_choices", "basic_forms"
end
