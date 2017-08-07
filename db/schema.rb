# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170807024754) do

  create_table "card_transactions", force: :cascade do |t|
    t.integer  "card_id"
    t.string   "action"
    t.string   "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "card_transactions", ["card_id"], name: "index_card_transactions_on_card_id"

  create_table "cards", force: :cascade do |t|
    t.integer  "registration_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "cards", ["registration_id"], name: "index_cards_on_registration_id"

  create_table "friends_cards", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends_rewards", force: :cascade do |t|
    t.string   "business_name"
    t.string   "listing_link"
    t.text     "address"
    t.text     "friends_terms"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "reward_id"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "recurring"
    t.string   "period"
    t.integer  "cycles"
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "name"
    t.string   "ic_number"
    t.datetime "date_of_birth"
    t.string   "contact_number"
    t.string   "email"
    t.string   "instagram_account"
    t.boolean  "facebook_ads"
    t.boolean  "facebook_newsfeed"
    t.boolean  "facebook_video"
    t.boolean  "instagram"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "membership_id"
    t.text     "notification_params"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "purchased_at"
    t.string   "shipping_address"
    t.string   "name_person_2"
    t.string   "ic_person_2"
    t.datetime "dob_person_2"
    t.string   "email_person_2"
  end

  add_index "registrations", ["membership_id"], name: "index_registrations_on_membership_id"

  create_table "rewards", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
