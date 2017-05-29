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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170520012538) do

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "string"
=======
ActiveRecord::Schema.define(version: 20170529034305) do

  create_table "collections", force: :cascade do |t|
    t.float    "max_value"
    t.text     "report"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratories", force: :cascade do |t|
    t.string   "name"
<<<<<<< HEAD
    t.string   "string"
    t.string   "dep_name"
    t.string   "facilitador"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
=======
    t.integer  "department_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_laboratories_on_department_id"
    t.index ["user_id"], name: "index_laboratories_on_user_id"
  end

  create_table "registers", force: :cascade do |t|
    t.float    "weight",        default: 0.0
    t.integer  "department_id"
    t.integer  "laboratory_id"
    t.integer  "residue_id"
    t.integer  "collection_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["collection_id"], name: "index_registers_on_collection_id"
    t.index ["department_id"], name: "index_registers_on_department_id"
    t.index ["laboratory_id"], name: "index_registers_on_laboratory_id"
    t.index ["residue_id"], name: "index_registers_on_residue_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "laboratory_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["laboratory_id"], name: "index_requests_on_laboratory_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
  end

  create_table "residues", force: :cascade do |t|
    t.string   "name"
<<<<<<< HEAD
    t.string   "string"
    t.string   "lab_name"
    t.string   "weight"
    t.string   "integer"
=======
    t.string   "type"
    t.string   "blend"
    t.string   "onu"
    t.string   "code"
    t.integer  "laboratory_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["laboratory_id"], name: "index_residues_on_laboratory_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.date     "birthday"
    t.string   "gender"
    t.string   "place"
    t.integer  "number"
    t.string   "cep"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "phone"
    t.string   "cell_phone"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
