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

ActiveRecord::Schema.define(version: 20151026003317) do

  create_table "priorities", force: :cascade do |t|
    t.string   "title"
    t.integer  "rank"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "priorities", ["user_id", "created_at"], name: "index_priorities_on_user_id_and_created_at"
  add_index "priorities", ["user_id"], name: "index_priorities_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["user_id", "created_at"], name: "index_tags_on_user_id_and_created_at"
  add_index "tags", ["user_id"], name: "index_tags_on_user_id"

  create_table "task_tags", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_tags", ["tag_id", "created_at"], name: "index_task_tags_on_tag_id_and_created_at"
  add_index "task_tags", ["tag_id"], name: "index_task_tags_on_tag_id"
  add_index "task_tags", ["task_id", "created_at"], name: "index_task_tags_on_task_id_and_created_at"
  add_index "task_tags", ["task_id"], name: "index_task_tags_on_task_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "priority_id"
    t.integer  "tag_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "due_date"
  end

  add_index "tasks", ["priority_id", "created_at"], name: "index_tasks_on_priority_id_and_created_at"
  add_index "tasks", ["priority_id"], name: "index_tasks_on_priority_id"
  add_index "tasks", ["tag_id", "created_at"], name: "index_tasks_on_tag_id_and_created_at"
  add_index "tasks", ["tag_id"], name: "index_tasks_on_tag_id"
  add_index "tasks", ["user_id", "created_at"], name: "index_tasks_on_user_id_and_created_at"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
