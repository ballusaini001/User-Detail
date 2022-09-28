
ActiveRecord::Schema.define(version: 2022_09_27_165414) do

  create_table "details", force: :cascade do |t|
    t.string "First_name"
    t.string "Last_name"
    t.string "Caste"
    t.integer "Age"
    t.float "Height_in_CMs"
    t.float "Weight_in_KGs"
    t.string "Phone_no"
    t.string "Email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
