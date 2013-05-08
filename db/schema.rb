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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130115060421) do

  create_table "action_roles", :force => true do |t|
    t.integer  "user_action_id"
    t.integer  "role_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "action_roles", ["role_id"], :name => "index_action_roles_on_role_id"
  add_index "action_roles", ["user_action_id"], :name => "index_action_roles_on_user_action_id"

  create_table "announcements", :force => true do |t|
    t.text     "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "code_reviews", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "weekly_journal_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"
  add_index "comments", ["weekly_journal_id"], :name => "index_comments_on_weekly_journal_id"

  create_table "journals", :force => true do |t|
    t.integer  "user_id"
    t.string   "receivers"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "positive_energies", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "positive_energies", ["user_id"], :name => "index_positive_energies_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "upload_files", :force => true do |t|
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "video"
  end

  create_table "user_actions", :force => true do |t|
    t.string   "action_name"
    t.string   "name"
    t.boolean  "as_default"
    t.boolean  "as_available"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
    t.string   "employee_id"
    t.string   "avatar"
  end

  create_table "weekly_journal_votes", :force => true do |t|
    t.integer  "weekly_journal_id"
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "week"
  end

  add_index "weekly_journal_votes", ["user_id"], :name => "index_weekly_journal_votes_on_user_id"
  add_index "weekly_journal_votes", ["weekly_journal_id"], :name => "index_weekly_journal_votes_on_weekly_journal_id"

  create_table "weekly_journals", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "visited_times", :default => 0
    t.integer  "year"
    t.integer  "month"
    t.integer  "week"
    t.integer  "user_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "weekly_journals", ["user_id"], :name => "index_weekly_journals_on_user_id"
  add_index "weekly_journals", ["week"], :name => "index_weekly_journals_on_week"

end
