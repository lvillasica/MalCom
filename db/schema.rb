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

ActiveRecord::Schema.define(:version => 20110615070529) do

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "position"
    t.boolean  "can_create_project"
    t.boolean  "can_update_project"
    t.boolean  "can_delete_project"
    t.boolean  "can_read_project"
    t.boolean  "can_create_ticket"
    t.boolean  "can_read_ticket"
    t.boolean  "can_update_ticket"
    t.boolean  "can_delete_ticket"
    t.boolean  "can_create_comment"
    t.boolean  "can_read_comment"
    t.boolean  "can_delete_comment"
    t.boolean  "can_create_tag"
    t.boolean  "can_read_tag"
    t.boolean  "can_update_tag"
    t.boolean  "can_delete_tag"
    t.boolean  "can_add_member"
    t.boolean  "can_remove_member"
    t.boolean  "can_assign_ticket"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "label"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_tickets", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "ticket_id"
  end

  create_table "tickets", :force => true do |t|
    t.string   "ticket_name"
    t.text     "ticket_description"
    t.string   "status"
    t.string   "priority"
    t.integer  "assigned_to"
    t.integer  "logged_time"
    t.integer  "created_by"
    t.string   "tracker_type"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.datetime "locked_at"
    t.string   "username"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.date     "birthdate"
    t.string   "status"
    t.integer  "role_id"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
