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

ActiveRecord::Schema.define(version: 20140225030225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attack_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "battle_actions", force: true do |t|
    t.integer  "npc_id"
    t.string   "name"
    t.integer  "base_attack"
    t.integer  "base_damage"
    t.integer  "attack_type_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "battle_actions", ["attack_type_id"], name: "index_battle_actions_on_attack_type_id", using: :btree
  add_index "battle_actions", ["npc_id"], name: "index_battle_actions_on_npc_id", using: :btree

  create_table "hero_items", force: true do |t|
    t.integer  "hero_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "used_at"
    t.boolean  "equiped"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hero_items", ["hero_id"], name: "index_hero_items_on_hero_id", using: :btree
  add_index "hero_items", ["item_id"], name: "index_hero_items_on_item_id", using: :btree

  create_table "heros", force: true do |t|
    t.integer  "npc_id"
    t.integer  "experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scene_id"
    t.integer  "hp"
  end

  add_index "heros", ["npc_id"], name: "index_heros_on_npc_id", using: :btree
  add_index "heros", ["scene_id"], name: "index_heros_on_scene_id", using: :btree

  create_table "item_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.decimal  "weight"
    t.integer  "price"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_type_id"
    t.integer  "item_value"
    t.boolean  "equipable"
    t.boolean  "usable"
  end

  add_index "items", ["item_type_id"], name: "index_items_on_item_type_id", using: :btree

  create_table "metaparams", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "model_id"
    t.string   "model_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metaparams", ["model_id", "model_type"], name: "index_metaparams_on_model_id_and_model_type", using: :btree

  create_table "monster_instances", force: true do |t|
    t.integer  "monster_id"
    t.integer  "hp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hero_id"
    t.datetime "killed_at"
  end

  add_index "monster_instances", ["hero_id"], name: "index_monster_instances_on_hero_id", using: :btree
  add_index "monster_instances", ["monster_id"], name: "index_monster_instances_on_monster_id", using: :btree

  create_table "monsters", force: true do |t|
    t.integer  "npc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "monsters", ["npc_id"], name: "index_monsters_on_npc_id", using: :btree

  create_table "npcs", force: true do |t|
    t.integer  "hp"
    t.integer  "level"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "strength"
    t.integer  "intelligence"
    t.integer  "agility"
  end

  create_table "scene_actions", force: true do |t|
    t.string   "name"
    t.integer  "scene_id"
    t.integer  "scene_callback_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scene_actions", ["scene_id"], name: "index_scene_actions_on_scene_id", using: :btree

  create_table "scene_monsters", force: true do |t|
    t.integer  "scene_id"
    t.integer  "monster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scene_monsters", ["monster_id"], name: "index_scene_monsters_on_monster_id", using: :btree
  add_index "scene_monsters", ["scene_id"], name: "index_scene_monsters_on_scene_id", using: :btree

  create_table "scene_nodes", force: true do |t|
    t.integer  "scene_id"
    t.integer  "neighbor_scene_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scene_nodes", ["scene_id"], name: "index_scene_nodes_on_scene_id", using: :btree

  create_table "scenes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "server_configs", force: true do |t|
    t.integer  "encounter_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
