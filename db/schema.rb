# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_15_123212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventures", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "slug", limit: 100, null: false
    t.text "descr", default: "", null: false
    t.text "intro"
    t.string "rating", limit: 32, default: "general", null: false
    t.string "genre", limit: 32, default: "fantasy", null: false
    t.string "access", limit: 32, default: "private", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sprite_map_id", null: false
  end

  create_table "map_regions", force: :cascade do |t|
    t.bigint "map_id", null: false
    t.bigint "region_id", null: false
    t.integer "map_x", default: 20, null: false
    t.integer "map_y", default: 20, null: false
    t.integer "region_x", default: 20, null: false
    t.integer "region_y", default: 20, null: false
    t.string "travel", limit: 50, default: "ask-before", null: false
    t.text "enter_region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["map_id"], name: "index_map_regions_on_map_id"
    t.index ["region_id"], name: "index_map_regions_on_region_id"
  end

  create_table "maps", force: :cascade do |t|
    t.bigint "adventure_id", null: false
    t.string "name", limit: 100, null: false
    t.text "descr", default: "", null: false
    t.integer "width", default: 40, null: false
    t.integer "height", default: 40, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adventure_id"], name: "index_maps_on_adventure_id"
  end

  create_table "regions", force: :cascade do |t|
    t.bigint "adventure_id", null: false
    t.string "name", limit: 200, null: false
    t.text "descr", default: "", null: false
    t.integer "width", default: 40, null: false
    t.integer "height", default: 40, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adventure_id"], name: "index_regions_on_adventure_id"
  end

  create_table "sprite_maps", force: :cascade do |t|
    t.string "name", null: false
    t.string "path", null: false
    t.integer "sprite_width", default: 64, null: false
    t.integer "sprite_height", default: 96, null: false
    t.integer "width", default: 640, null: false
    t.integer "height", default: 960, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["path"], name: "index_sprite_maps_on_path", unique: true
  end

  add_foreign_key "map_regions", "maps"
  add_foreign_key "map_regions", "regions"
  add_foreign_key "maps", "adventures"
  add_foreign_key "regions", "adventures"
end
