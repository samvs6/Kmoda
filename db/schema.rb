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

ActiveRecord::Schema.define(version: 20160513032951) do

  create_table "clients", force: :cascade do |t|
    t.string   "nit"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designs", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "materials", force: :cascade do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.string   "color"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "codigo"
    t.string   "nombre"
    t.decimal  "costo"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tipo"
  end

  create_table "sale_products", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sale_products", ["product_id"], name: "index_sale_products_on_product_id"
  add_index "sale_products", ["sale_id"], name: "index_sale_products_on_sale_id"

  create_table "sales", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "finished"
  end

  add_index "sales", ["client_id"], name: "index_sales_on_client_id"

end
