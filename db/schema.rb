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

ActiveRecord::Schema.define(version: 20160811100857) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "inventory_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "book_id"
    t.decimal  "available_quantity", precision: 10
    t.decimal  "total_quantity",     precision: 10
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["book_id"], name: "index_inventory_items_on_book_id", using: :btree
  end

  create_table "loaned_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "inventory_item_id"
    t.integer  "user_id"
    t.decimal  "loaned_quantity",   precision: 10
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["inventory_item_id"], name: "index_loaned_items_on_inventory_item_id", using: :btree
    t.index ["user_id"], name: "index_loaned_items_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

  add_foreign_key "inventory_items", "books"
  add_foreign_key "loaned_items", "inventory_items"
  add_foreign_key "loaned_items", "users"
end
