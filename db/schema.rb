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

ActiveRecord::Schema.define(version: 20160215210802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: :cascade do |t|
    t.string   "name",        limit: 63,                     null: false
    t.text     "description",            default: "",        null: false
    t.text     "intro"
    t.string   "rating",                 default: "general", null: false
    t.string   "access",                 default: "private", null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "maps", force: :cascade do |t|
    t.integer  "adventure_id",              null: false
    t.string   "name",                      null: false
    t.text     "description",  default: "", null: false
    t.integer  "width",        default: 40, null: false
    t.integer  "height",       default: 40, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["adventure_id"], name: "index_maps_on_adventure_id", using: :btree
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name",        limit: 48,              null: false
    t.string   "slug",        limit: 48,              null: false
    t.text     "description",            default: "", null: false
    t.string   "path",                                null: false
    t.string   "category",    limit: 48,              null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["slug"], name: "index_pictures_on_slug", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.integer  "map_id",                       null: false
    t.string   "name",                         null: false
    t.text     "description",     default: "", null: false
    t.integer  "width",           default: 40, null: false
    t.integer  "height",          default: 40, null: false
    t.integer  "x"
    t.integer  "y"
    t.integer  "tile_picture_id"
    t.text     "enter"
    t.text     "leave"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["map_id"], name: "index_regions_on_map_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "region_id",                null: false
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.integer  "width",       default: 10, null: false
    t.integer  "height",      default: 10, null: false
    t.integer  "x",                        null: false
    t.integer  "y",                        null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["region_id"], name: "index_rooms_on_region_id", using: :btree
  end

end
