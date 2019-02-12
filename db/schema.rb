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

ActiveRecord::Schema.define(version: 20190211234104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "website_url"
    t.string   "blog_url"
    t.string   "twitter_url"
    t.string   "facebook_url"
    t.string   "linkedin_url"
    t.string   "job_postings_url"
    t.text     "why_work_here"
    t.integer  "max_degrees_separation"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "content_posts", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "url"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "content_posts", ["company_id"], name: "index_content_posts_on_company_id", using: :btree

  create_table "content_recommendations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "content_recommendations", ["company_id"], name: "index_content_recommendations_on_company_id", using: :btree
  add_index "content_recommendations", ["user_id"], name: "index_content_recommendations_on_user_id", using: :btree

  create_table "hire_recommendations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hire_recommendations", ["company_id"], name: "index_hire_recommendations_on_company_id", using: :btree
  add_index "hire_recommendations", ["user_id"], name: "index_hire_recommendations_on_user_id", using: :btree

  create_table "trust_links", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "trusted_user_id", null: false
    t.integer  "trust_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "trust_links", ["trust_type_id"], name: "index_trust_links_on_trust_type_id", using: :btree
  add_index "trust_links", ["trusted_user_id", "user_id"], name: "index_trust_links_on_trusted_user_id_and_user_id", unique: true, using: :btree
  add_index "trust_links", ["user_id"], name: "index_trust_links_on_user_id", using: :btree

  create_table "trust_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              null: false
    t.string   "token",              null: false
    t.string   "password_digest",    null: false
    t.boolean  "hbt_admin",          null: false
    t.boolean  "company_admin",      null: false
    t.boolean  "trusted_dev",        null: false
    t.string   "givenname",          null: false
    t.string   "surname",            null: false
    t.string   "linkedin_url"
    t.string   "personal_site_url"
    t.string   "twitter_url"
    t.string   "github_url"
    t.string   "blurb"
    t.string   "profile_img_url"
    t.integer  "current_company_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "users", ["current_company_id"], name: "index_users_on_current_company_id", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["github_url"], name: "index_users_on_github_url", unique: true, using: :btree
  add_index "users", ["linkedin_url"], name: "index_users_on_linkedin_url", unique: true, using: :btree
  add_index "users", ["personal_site_url"], name: "index_users_on_personal_site_url", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree
  add_index "users", ["twitter_url"], name: "index_users_on_twitter_url", unique: true, using: :btree

  add_foreign_key "content_posts", "companies"
  add_foreign_key "content_recommendations", "companies"
  add_foreign_key "content_recommendations", "users"
  add_foreign_key "hire_recommendations", "companies"
  add_foreign_key "hire_recommendations", "users"
  add_foreign_key "trust_links", "trust_types"
  add_foreign_key "trust_links", "users"
end
