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

ActiveRecord::Schema.define(version: 2020_06_15_152009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "category", default: "npc", null: false
    t.bigint "room_id", null: false
    t.bigint "creature_id", null: false
    t.integer "x", default: 0, null: false
    t.integer "y", default: 0, null: false
    t.integer "speed", default: 6, null: false
    t.integer "life", default: 10, null: false
    t.integer "life_temp", default: 0, null: false
    t.integer "power", default: 10, null: false
    t.integer "power_temp", default: 0, null: false
    t.integer "constitution", default: 10, null: false
    t.integer "wisdom", default: 10, null: false
    t.integer "strength", default: 10, null: false
    t.integer "size", default: 10, null: false
    t.integer "dexterity", default: 10, null: false
    t.integer "encumbrance", default: 0, null: false
    t.integer "missile_skill", default: 10, null: false
    t.integer "armor_skill", default: 0, null: false
    t.integer "dodge_skill", default: 25, null: false
    t.integer "melee_skill", default: 25, null: false
    t.integer "parry_skill", default: 25, null: false
    t.string "magical_defense", default: "none", null: false
    t.string "personality", default: "Brave", null: false
    t.string "outlook", default: "Aggressive", null: false
    t.string "alliance", default: "Enemy", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creature_id"], name: "index_actors_on_creature_id"
    t.index ["room_id"], name: "index_actors_on_room_id"
  end

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

  create_table "creature_things", force: :cascade do |t|
    t.bigint "creature_id", null: false
    t.bigint "thing_id", null: false
    t.integer "count"
    t.boolean "equipped"
    t.integer "drop_percent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creature_id", "thing_id"], name: "idx_unique_creature_things", unique: true
    t.index ["creature_id"], name: "index_creature_things_on_creature_id"
    t.index ["thing_id"], name: "index_creature_things_on_thing_id"
  end

  create_table "creatures", force: :cascade do |t|
    t.bigint "adventure_id", null: false
    t.string "name", null: false
    t.text "descr", default: "0", null: false
    t.string "category", default: "npc", null: false
    t.integer "speed", default: 6, null: false
    t.integer "life", default: 10, null: false
    t.integer "constitution", default: 10, null: false
    t.integer "power", default: 10, null: false
    t.integer "wisdom", default: 10, null: false
    t.integer "strength", default: 10, null: false
    t.integer "size", default: 10, null: false
    t.integer "dexterity", default: 10, null: false
    t.integer "missile_skill", default: 10, null: false
    t.integer "armor_skill", default: 0, null: false
    t.integer "dodge_skill", default: 25, null: false
    t.integer "melee_skill", default: 25, null: false
    t.integer "parry_skill", default: 25, null: false
    t.string "magical_defense", default: "none", null: false
    t.string "personality", default: "Brave", null: false
    t.string "outlook", default: "Aggressive", null: false
    t.string "alliance", default: "Enemy", null: false
    t.integer "tile_idx", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adventure_id"], name: "index_creatures_on_adventure_id"
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

  create_table "rooms", force: :cascade do |t|
    t.bigint "region_id", null: false
    t.string "name", null: false
    t.text "descr", default: "", null: false
    t.integer "width", default: 10, null: false
    t.integer "height", default: 10, null: false
    t.integer "region_x", default: 0, null: false
    t.integer "region_y", default: 0, null: false
    t.integer "wall_tile_idx", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_rooms_on_region_id"
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

  create_table "terrains", force: :cascade do |t|
    t.bigint "map_id", null: false
    t.string "name", null: false
    t.text "descr", default: "", null: false
    t.boolean "block", default: false, null: false
    t.integer "encounter_chance", default: 0, null: false
    t.integer "tile_idx", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["map_id"], name: "index_terrains_on_map_id"
  end

  create_table "things", force: :cascade do |t|
    t.bigint "adventure_id", null: false
    t.string "name", null: false
    t.text "descr", default: "", null: false
    t.string "category", default: "treasure", null: false
    t.integer "weight", default: 1, null: false
    t.integer "value", default: 0, null: false
    t.boolean "droppable", default: true, null: false
    t.integer "power", default: 0, null: false
    t.integer "attack", default: 0, null: false
    t.integer "breakability", default: 0, null: false
    t.boolean "magic", default: false, null: false
    t.integer "range", default: 0, null: false
    t.integer "max_carry", default: 25000, null: false
    t.integer "max_stack", default: 1, null: false
    t.boolean "buyable", default: false, null: false
    t.integer "tile_idx", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adventure_id"], name: "index_things_on_adventure_id"
  end

  add_foreign_key "actors", "creatures"
  add_foreign_key "actors", "rooms"
  add_foreign_key "creature_things", "creatures"
  add_foreign_key "creature_things", "things"
  add_foreign_key "creatures", "adventures"
  add_foreign_key "map_regions", "maps"
  add_foreign_key "map_regions", "regions"
  add_foreign_key "maps", "adventures"
  add_foreign_key "regions", "adventures"
  add_foreign_key "rooms", "regions"
  add_foreign_key "terrains", "maps"
  add_foreign_key "things", "adventures"
end
