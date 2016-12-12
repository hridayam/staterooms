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

ActiveRecord::Schema.define(version: 20161206053922) do

  create_table "listings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.decimal  "price",                     precision: 10, scale: 2
    t.string   "title"
    t.text     "address",     limit: 65535
    t.text     "description", limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "user_id"
    t.string   "cover"
    t.index ["user_id"], name: "fk_rails_baa008bfd2", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "subject"
    t.text     "content",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "parent_id"
    t.index ["recipient_id"], name: "fk_rails_12e9de2e48", using: :btree
    t.index ["sender_id"], name: "fk_rails_b8f26a382d", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "firstname"
    t.string  "lastname"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "email_confirmed", default: false
    t.string  "confirm_token"
  end

  add_foreign_key "listings", "users"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
end
