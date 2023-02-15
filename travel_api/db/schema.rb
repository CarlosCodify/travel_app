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

ActiveRecord::Schema[7.0].define(version: 2023_02_15_145340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.string "type"
    t.integer "total_seats"
    t.integer "available_seats"
    t.string "status"
    t.bigint "year_manufacturer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_manufacturer_id"], name: "index_buses_on_year_manufacturer_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_routes", id: false, force: :cascade do |t|
    t.bigint "city_id", null: false
    t.bigint "route_id", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_customers_on_person_id"
  end

  create_table "driver_assistants", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_driver_assistants_on_staff_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "driver_license"
    t.bigint "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_drivers_on_staff_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "identity_document"
    t.boolean "status"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_people", force: :cascade do |t|
    t.bigint "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_sale_people_on_staff_id"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "total_amount"
    t.string "unitary_amount"
    t.bigint "sale_person_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sales_on_customer_id"
    t.index ["sale_person_id"], name: "index_sales_on_sale_person_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "seat_number"
    t.boolean "availability"
    t.bigint "bus_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_seats_on_bus_id"
    t.index ["travel_id"], name: "index_seats_on_travel_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_staffs_on_person_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "serial_number"
    t.bigint "sale_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "seat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
    t.index ["sale_id"], name: "index_tickets_on_sale_id"
    t.index ["seat_id"], name: "index_tickets_on_seat_id"
  end

  create_table "travels", force: :cascade do |t|
    t.date "departure_time"
    t.date "arrival_time"
    t.string "departure_city"
    t.string "arrival_city"
    t.string "status"
    t.bigint "bus_id", null: false
    t.bigint "route_id", null: false
    t.bigint "driver_id", null: false
    t.bigint "driver_assistant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_travels_on_bus_id"
    t.index ["driver_assistant_id"], name: "index_travels_on_driver_assistant_id"
    t.index ["driver_id"], name: "index_travels_on_driver_id"
    t.index ["route_id"], name: "index_travels_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string "name"
    t.bigint "manufacturer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_vehicle_models_on_manufacturer_id"
  end

  create_table "year_manufacturers", force: :cascade do |t|
    t.string "year"
    t.bigint "vehicle_model_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_model_id"], name: "index_year_manufacturers_on_vehicle_model_id"
  end

  add_foreign_key "buses", "year_manufacturers"
  add_foreign_key "customers", "people"
  add_foreign_key "driver_assistants", "staffs"
  add_foreign_key "drivers", "staffs"
  add_foreign_key "sale_people", "staffs"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "sale_people"
  add_foreign_key "seats", "buses"
  add_foreign_key "seats", "travels"
  add_foreign_key "staffs", "people"
  add_foreign_key "tickets", "customers"
  add_foreign_key "tickets", "sales"
  add_foreign_key "tickets", "seats"
  add_foreign_key "travels", "buses"
  add_foreign_key "travels", "driver_assistants"
  add_foreign_key "travels", "drivers"
  add_foreign_key "travels", "routes"
  add_foreign_key "vehicle_models", "manufacturers"
  add_foreign_key "year_manufacturers", "vehicle_models"
end
