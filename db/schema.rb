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

ActiveRecord::Schema[8.0].define(version: 2025_04_22_152505) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "kind", default: 0, null: false
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country", default: "Brasil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "categorizations", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_categorizations_on_category_id"
    t.index ["product_id", "category_id"], name: "index_categorizations_on_product_id_and_category_id", unique: true
    t.index ["product_id"], name: "index_categorizations_on_product_id"
  end

  create_table "discount_coupons", force: :cascade do |t|
    t.string "code", null: false
    t.integer "kind", null: false
    t.decimal "value", precision: 10, scale: 2
    t.integer "max_uses"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_discount_coupons_on_code", unique: true
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.integer "quantity", default: 1
    t.decimal "unit_price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_variant_id", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["product_variant_id"], name: "index_line_items_on_product_variant_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.integer "quantity", default: 1
    t.decimal "unit_price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_variant_id", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_variant_id"], name: "index_order_items_on_product_variant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "total", precision: 10, scale: 2
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shipping_address_id"
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "provider"
    t.string "provider_id"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "status", default: 0
    t.jsonb "payload"
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["provider", "provider_id"], name: "index_payments_on_provider_and_provider_id", unique: true
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.decimal "sphere", precision: 4, scale: 2, null: false
    t.decimal "cylinder", precision: 4, scale: 2
    t.integer "axis"
    t.decimal "add_power", precision: 3, scale: 2
    t.decimal "base_curve", precision: 3, scale: 2, null: false
    t.decimal "diameter", precision: 4, scale: 2, null: false
    t.string "color"
    t.integer "stock", default: 0, null: false
    t.decimal "unit_price", precision: 10, scale: 2
    t.string "sku"
    t.boolean "active", default: true, null: false
    t.jsonb "attribute_set"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "sphere", "cylinder", "axis", "add_power", "base_curve", "diameter"], name: "idx_variants_lookup"
    t.index ["product_id"], name: "index_product_variants_on_product_id"
    t.index ["sku"], name: "index_product_variants_on_sku", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10, scale: 2
    t.integer "stock", default: 0
    t.string "sku"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lens_type", default: 0, null: false
    t.integer "wear_schedule", default: 0, null: false
    t.string "material"
    t.decimal "water_content", precision: 5, scale: 2
    t.decimal "oxygen_permeability", precision: 6, scale: 2
    t.boolean "uv_filter", default: false, null: false
    t.integer "pack_quantity"
    t.boolean "active", default: true, null: false
    t.bigint "brand_id"
    t.index ["active", "price"], name: "index_products_on_active_and_price"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["lens_type"], name: "index_products_on_lens_type"
    t.index ["sku"], name: "index_products_on_sku"
    t.index ["slug"], name: "index_products_on_slug"
    t.index ["wear_schedule"], name: "index_products_on_wear_schedule"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "carrier"
    t.string "tracking_code"
    t.decimal "cost", precision: 10, scale: 2
    t.integer "status", default: 0
    t.datetime "shipped_at"
    t.datetime "delivered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shipments_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "carts", "users"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "products"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "product_variants"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "product_variants"
  add_foreign_key "orders", "addresses", column: "shipping_address_id"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "shipments", "orders"
end
