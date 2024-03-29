# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_11_22_195552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zip_code"
    t.string "address"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "uf"
    t.bigint "proponent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proponent_id"], name: "index_addresses_on_proponent_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.string "type"
    t.bigint "proponent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proponent_id"], name: "index_phones_on_proponent_id"
  end

  create_table "proponents", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.date "birth"
    t.string "cpf"
    t.integer "salary_cents", default: 0, null: false
    t.string "salary_currency", default: "BRL", null: false
    t.integer "discount_cents", default: 0, null: false
    t.string "discount_currency", default: "BRL", null: false
    t.integer "salary_band", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_proponents_on_cpf", unique: true
  end

  add_foreign_key "addresses", "proponents"
  add_foreign_key "phones", "proponents"
end
