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

ActiveRecord::Schema[7.1].define(version: 2024_04_16_065345) do
  create_table "spp_batches", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spp_categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spp_invoices", force: :cascade do |t|
    t.integer "spp_student_id", null: false
    t.integer "spp_category_id", null: false
    t.integer "amount"
    t.integer "paid_amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spp_category_id"], name: "index_spp_invoices_on_spp_category_id"
    t.index ["spp_student_id"], name: "index_spp_invoices_on_spp_student_id"
  end

  create_table "spp_payments", force: :cascade do |t|
    t.integer "spp_batch_id", null: false
    t.integer "user_id", null: false
    t.integer "spp_student_id", null: false
    t.integer "spp_invoice_id", null: false
    t.string "tipe"
    t.integer "amount"
    t.datetime "pay_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spp_batch_id"], name: "index_spp_payments_on_spp_batch_id"
    t.index ["spp_invoice_id"], name: "index_spp_payments_on_spp_invoice_id"
    t.index ["spp_student_id"], name: "index_spp_payments_on_spp_student_id"
    t.index ["user_id"], name: "index_spp_payments_on_user_id"
  end

  create_table "spp_students", force: :cascade do |t|
    t.integer "spp_batch_id", null: false
    t.string "nis"
    t.string "name"
    t.string "gender"
    t.datetime "birth_at"
    t.string "address"
    t.string "pict"
    t.string "father"
    t.string "mother"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spp_batch_id"], name: "index_spp_students_on_spp_batch_id"
  end

  add_foreign_key "spp_invoices", "spp_categories"
  add_foreign_key "spp_invoices", "spp_students"
  add_foreign_key "spp_payments", "spp_batches"
  add_foreign_key "spp_payments", "spp_invoices"
  add_foreign_key "spp_payments", "spp_students"
  add_foreign_key "spp_payments", "users"
  add_foreign_key "spp_students", "spp_batches"
end
