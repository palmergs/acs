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

ActiveRecord::Schema.define(version: 20160219144233) do

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

  create_table "creatures", force: :cascade do |t|
    t.string   "type",                                   null: false
    t.integer  "adventure_id",                           null: false
    t.integer  "tile_picture_id",                        null: false
    t.string   "name",                                   null: false
    t.text     "description",     default: "",           null: false
    t.integer  "speed",           default: 6,            null: false
    t.integer  "life_force",      default: 10,           null: false
    t.integer  "constitution",    default: 10,           null: false
    t.integer  "power",           default: 10,           null: false
    t.integer  "wisdom",          default: 10,           null: false
    t.integer  "strength",        default: 10,           null: false
    t.integer  "size",            default: 10,           null: false
    t.integer  "dexterity",       default: 10,           null: false
    t.integer  "missile_skill",   default: 10,           null: false
    t.integer  "armor_skill",     default: 0,            null: false
    t.integer  "dodge_skill",     default: 25,           null: false
    t.integer  "melee_skill",     default: 25,           null: false
    t.integer  "parry_skill",     default: 25,           null: false
    t.string   "magical_defense", default: "none",       null: false
    t.string   "personality",     default: "fighter",    null: false
    t.string   "outlook",         default: "aggressive", null: false
    t.string   "alliance",        default: "enemy",      null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["adventure_id"], name: "index_creatures_on_adventure_id", using: :btree
    t.index ["tile_picture_id"], name: "index_creatures_on_tile_picture_id", using: :btree
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

  create_table "room_creatures", force: :cascade do |t|
    t.integer  "room_id",     null: false
    t.integer  "creature_id", null: false
    t.integer  "x",           null: false
    t.integer  "y",           null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["creature_id"], name: "index_room_creatures_on_creature_id", using: :btree
    t.index ["room_id"], name: "index_room_creatures_on_room_id", using: :btree
    t.index ["x"], name: "index_room_creatures_on_x", using: :btree
    t.index ["y"], name: "index_room_creatures_on_y", using: :btree
  end

  create_table "room_things", force: :cascade do |t|
    t.integer  "room_id",    null: false
    t.integer  "thing_id",   null: false
    t.integer  "x",          null: false
    t.integer  "y",          null: false
    t.integer  "z",          null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_things_on_room_id", using: :btree
    t.index ["thing_id"], name: "index_room_things_on_thing_id", using: :btree
    t.index ["x"], name: "index_room_things_on_x", using: :btree
    t.index ["y"], name: "index_room_things_on_y", using: :btree
    t.index ["z"], name: "index_room_things_on_z", using: :btree
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

  create_table "terrain_creatures", force: :cascade do |t|
    t.integer  "terrain_id",               null: false
    t.integer  "creature_id",              null: false
    t.text     "message",     default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["creature_id"], name: "index_terrain_creatures_on_creature_id", using: :btree
    t.index ["terrain_id"], name: "index_terrain_creatures_on_terrain_id", using: :btree
  end

  create_table "terrains", force: :cascade do |t|
    t.integer  "map_id",                                   null: false
    t.string   "name",             limit: 63,              null: false
    t.text     "description",                 default: "", null: false
    t.integer  "tile_picture_id",                          null: false
    t.integer  "encounter_chance",            default: 0,  null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["map_id"], name: "index_terrains_on_map_id", using: :btree
  end

  create_table "things", force: :cascade do |t|
    t.string   "type",            limit: 63,                 null: false
    t.integer  "adventure_id",                               null: false
    t.integer  "tile_picture_id",                            null: false
    t.string   "activate_on",     limit: 31
    t.integer  "spell_id"
    t.string   "name",            limit: 63,                 null: false
    t.text     "description",                default: "",    null: false
    t.integer  "weight",                     default: 0,     null: false
    t.integer  "value",                      default: 0,     null: false
    t.boolean  "disappear",                  default: true,  null: false
    t.integer  "power",                      default: 0,     null: false
    t.integer  "attack_adj",                 default: 0,     null: false
    t.integer  "breakability",               default: 0,     null: false
    t.boolean  "magic",                      default: false, null: false
    t.boolean  "owner_only",                 default: false, null: false
    t.integer  "range",                      default: 0,     null: false
    t.text     "pickup"
    t.text     "drop"
    t.integer  "max_carry",                  default: 25000, null: false
    t.integer  "max_stack",                  default: 1,     null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["adventure_id"], name: "index_things_on_adventure_id", using: :btree
    t.index ["tile_picture_id"], name: "index_things_on_tile_picture_id", using: :btree
  end

  create_table "tile_pictures", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "adventure_id"
    t.string   "name",         limit: 63,              null: false
    t.text     "description",             default: "", null: false
    t.string   "path",                                 null: false
    t.string   "category",     limit: 31,              null: false
    t.string   "setting",      limit: 31,              null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["adventure_id"], name: "index_tile_pictures_on_adventure_id", using: :btree
    t.index ["user_id"], name: "index_tile_pictures_on_user_id", using: :btree
  end

end
